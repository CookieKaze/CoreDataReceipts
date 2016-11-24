//
//  AddViewController.m
//  Receipts++
//
//  Created by Erin Luu on 2016-11-24.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import "AddViewController.h"
#import "Receipt+CoreDataClass.h"
#import "Tag+CoreDataClass.h"


@interface AddViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UITextView *receiptDesc;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIView *categoryView;

@property (weak, nonatomic) IBOutlet UIButton *catPersonalButton;
@property (nonatomic) BOOL catPersonalChecked;
@property (weak, nonatomic) IBOutlet UIButton *catFamilyButton;
@property (nonatomic) BOOL catFamilyChecked;
@property (weak, nonatomic) IBOutlet UIButton *catBusinessButton;
@property (nonatomic) BOOL catBusinessChecked;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.catPersonalChecked = NO;
    self.catFamilyChecked = NO;
    self.catBusinessChecked = NO;
    
    self.receiptDesc.layer.borderWidth = 1;
    self.receiptDesc.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.receiptDesc.layer.cornerRadius = 8;
    self.amountTextField.layer.borderWidth = 1;
    self.amountTextField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.amountTextField.layer.cornerRadius = 8;
}

#pragma mark - Category CheckBoxes
- (IBAction)catPersonalButtonTapped:(UIButton *)sender {
    self.catPersonalChecked = (self.catPersonalChecked == NO) ? YES : NO;
    [self updateCheckBoxes:@"personal"];
}
- (IBAction)catFamilyButtonTapped:(UIButton *)sender {
    self.catFamilyChecked = (self.catFamilyChecked == NO) ? YES : NO;
    [self updateCheckBoxes:@"family"];
}
- (IBAction)catBusinessButtonTapped:(UIButton *)sender {
    self.catBusinessChecked = (self.catBusinessChecked == NO) ? YES : NO;
    [self updateCheckBoxes:@"business"];
}
-(void) updateCheckBoxes: (NSString*) checkBox {
    UIImage *check = [UIImage imageNamed:@"check.png"];
    UIImage *uncheck = [UIImage imageNamed:@"uncheck.png"];
    
    if ([checkBox isEqualToString:@"personal"]) {
        if (self.catPersonalChecked) {
            [self.catPersonalButton setBackgroundImage:check forState:UIControlStateNormal];
        }else{
            [self.catPersonalButton setBackgroundImage:uncheck forState:UIControlStateNormal];
        }
    }else if ([checkBox isEqualToString:@"family"]) {
        if (self.catFamilyChecked) {
            [self.catFamilyButton setBackgroundImage:check forState:UIControlStateNormal];
        }else{
            [self.catFamilyButton setBackgroundImage:uncheck forState:UIControlStateNormal];
        }
    }else if ([checkBox isEqualToString:@"business"]) {
        if (self.catBusinessChecked) {
            [self.catBusinessButton setBackgroundImage:check forState:UIControlStateNormal];
        }else{
            [self.catBusinessButton setBackgroundImage: uncheck forState:UIControlStateNormal];
        }
    }
}

#pragma mark - Segue Buttons
- (IBAction)addButtonTapped:(UIButton *)sender {
    
    //Create new receipt
    Receipt * newReceipt = [NSEntityDescription insertNewObjectForEntityForName:@"Recepit" inManagedObjectContext:self.context];
    newReceipt.amount = [self.amountTextField.text floatValue];
    newReceipt.note = self.receiptDesc.text;
    newReceipt.timeStamp = self.datePicker.date;
    
    
    
}


#pragma mark - Keyboard Stuff
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.amountTextField resignFirstResponder];
    [self.receiptDesc resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
