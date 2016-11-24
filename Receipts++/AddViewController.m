//
//  AddViewController.m
//  Receipts++
//
//  Created by Erin Luu on 2016-11-24.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UITextView *receiptDesc;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIView *categoryView;
@property (weak, nonatomic) IBOutlet UIView *catPersonalButton;
@property (weak, nonatomic) IBOutlet UIView *catFamilyButton;
@property (weak, nonatomic) IBOutlet UIView *catBusinessButton;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Category CheckBoxes
- (IBAction)catPersonalButtonTapped:(UIButton *)sender {
}
- (IBAction)catFamilyButtonTapped:(UIButton *)sender {
}
- (IBAction)catBusinessButtonTapped:(UIButton *)sender {
}

#pragma mark - Segue Buttons
- (IBAction)addButtonTapped:(UIButton *)sender {
}

@end
