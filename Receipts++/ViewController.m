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

@interface ViewController () <UIApplicationDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getTags];
    
    
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

- (IBAction)unwindToMainMenu:(UIStoryboardSegue*)sender

{
    UIViewController *sourceViewController = sender.sourceViewController;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toAddView"]) {
        AddViewController * addView = [segue destinationViewController];
        addView.context = self.context;

    }
}

#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}





@end
