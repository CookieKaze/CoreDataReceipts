//
//  ViewController.m
//  Receipts++
//
//  Created by Erin Luu on 2016-11-24.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIApplicationDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)addButtonTapped:(UIButton *)sender {
    [self performSegueWithIdentifier:@"toAddView" sender:nil];
}

- (IBAction)unwindToMainMenu:(UIStoryboardSegue*)sender

{
    UIViewController *sourceViewController = sender.sourceViewController;
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
