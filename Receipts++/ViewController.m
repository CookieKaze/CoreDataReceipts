//
//  ViewController.m
//  Receipts++
//
//  Created by Erin Luu on 2016-11-24.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import "ViewController.h"
#import "AddViewController.h"
#import "Tag+CoreDataClass.h"
#import "Receipt+CoreDataClass.h"

@interface ViewController () <UIApplicationDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getTags];
    [self generateData];
}

-(void) generateData {
    self.tableData = [[NSMutableArray alloc] init];
    //Generate table data
    //Fetch all tags
    NSFetchRequest * tagFetch = [[NSFetchRequest alloc] init];
    NSEntityDescription * tagEntity = [NSEntityDescription entityForName:@"Tag" inManagedObjectContext:self.context];
    [tagFetch setEntity:tagEntity];
    NSError * error = nil;
    self.tagList = [self.context executeFetchRequest:tagFetch error:&error];
    
    //Loop through all tags and do a fetch for all the related receipts
    for (Tag * tag in self.tagList) {
        NSFetchRequest * receiptFetch = [[NSFetchRequest alloc] init];
        NSEntityDescription * receiptEntity = [NSEntityDescription entityForName:@"Receipt" inManagedObjectContext:self.context];
        [receiptFetch setEntity:receiptEntity];
        NSPredicate * predicate = [NSPredicate predicateWithFormat:@"ANY %K == %@",@"tag.name", tag.name];
        [receiptFetch setPredicate:predicate];
        NSArray<Receipt*> * receipts = [self.context executeFetchRequest:receiptFetch error:&error];
        [self.tableData addObject:receipts];
    }
}


#pragma mark - Tags Management
-(void) getTags {
    //Fetch all tags
    NSFetchRequest * tagFetch = [[NSFetchRequest alloc] init];
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"Tag" inManagedObjectContext:self.context];
    [tagFetch setEntity:entity];
    NSError * error = nil;
    NSArray * tags = [self.context executeFetchRequest:tagFetch error:&error];
    if (error) {
        NSLog(@"Error fetching tags: %@", error.localizedDescription);
        abort();
    }
    //If there are no tags than create them
    if (tags.count == 0) {
        [self createTags];
    }
}

-(void) createTags {
    NSError * error = nil;
    Tag * tagPersonal = [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:self.context];
    tagPersonal.name = @"personal";
    Tag * tagFamily = [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:self.context];
    tagFamily.name = @"family";
    Tag * tagBusiness = [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:self.context];
    tagBusiness.name = @"business";
    [self.context save:&error];
    if (error) {
        NSLog(@"Error saving tags: %@", error.localizedDescription);
        abort();
    }
}

#pragma mark - Segue Stuff
- (IBAction)addButtonTapped:(UIButton *)sender {
    [self performSegueWithIdentifier:@"toAddView" sender:nil];
}

- (IBAction)unwindToMainMenu:(UIStoryboardSegue*)sender {
    [self generateData];
    [self.tableView reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toAddView"]) {
        AddViewController * addView = [segue destinationViewController];
        addView.context = self.context;
        
    }
}

#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tableData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray * receipts = self.tableData[section];
    return receipts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSArray * receipts = self.tableData[indexPath.section];
    Receipt * receipt = receipts[indexPath.row];
    cell.textLabel.text = receipt.note.capitalizedString;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    Tag * tag = self.tagList[section];
    return tag.name.capitalizedString;
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

@end
