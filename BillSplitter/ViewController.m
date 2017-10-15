//
//  ViewController.m
//  BillSplitter
//
//  Created by Olga on 10/14/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UILabel *showResult;
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (nonatomic, assign) int sliderCurrentValue; //Check if this really needed
@property (nonatomic) NSDecimalNumber *billAmountInDollars;
@property (nonatomic) NSString *usersInputAmount;
@property (nonatomic) NSDecimalNumber *eachPersonPays;
@property (nonatomic) NSDecimalNumber *numberOfPeople;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTextField]; //show phonePad keyboard and "x" sign when done editing
}

-(void)getUsersAmountInput {
    NSString *usersInputAmount;
    usersInputAmount = self.billAmountTextField.text;
    NSLog(@"user's Amount input: %@", usersInputAmount);
    self.billAmountInDollars = [NSDecimalNumber decimalNumberWithString:self.usersInputAmount];
    NSLog(@"user's amount input as DecimalNumber: %@", self.billAmountTextField);
}

- (IBAction)getNumberOfPeople:(UISlider *)sender {
    int sliderCurrentValue = sender.value;
    NSDecimalNumber *numberOfPeople = [NSDecimalNumber numberWithInteger:sliderCurrentValue];
    NSLog(@"User entered %@ people", numberOfPeople);
    self.sliderLabel.text = [NSString stringWithFormat:@"%i", sliderCurrentValue];
}


- (IBAction)calculateSplitAmount:(id)sender {
    [self getUsersAmountInput];
    [self getNumberOfPeople:sender];
    
    NSDecimalNumber *eachPersonPays = [self.billAmountInDollars decimalNumberByDividingBy:self.numberOfPeople];
    
    NSLog(@"Each person pays: %@", eachPersonPays);
    
    NSString *eachPersonPaysString = [NSString stringWithFormat:@"Each person pays: %@", self.eachPersonPays];
    [self.showResult setText:eachPersonPaysString];
    
    [self.billAmountTextField setText:@""];
    [self.billAmountTextField resignFirstResponder];
    

}

- (void)setupTextField
{
    // set the keyboard type to phonePad
    self.billAmountTextField.keyboardType = UIKeyboardTypePhonePad;
    self.billAmountTextField.clearButtonMode = UITextFieldViewModeUnlessEditing;
    
//    self.tipAmountTextField.keyboardType = UIKeyboardTypePhonePad;
//    self.tipAmountTextField.clearButtonMode = UITextFieldViewModeUnlessEditing;
//
}

@end
