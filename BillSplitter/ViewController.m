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
@property (nonatomic) NSDecimalNumber *billAmountInDollars;
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
    self.billAmountInDollars = [NSDecimalNumber decimalNumberWithString:usersInputAmount];
    NSLog(@"user's amount input as DecimalNumber: %@", self.billAmountTextField);
}

- (IBAction)getNumberOfPeople:(UISlider *)sender {
    int sliderCurrentValue = sender.value;
    self.numberOfPeople = [[NSDecimalNumber alloc] initWithInt:sliderCurrentValue];
    NSLog(@"User entered %@ people", self.numberOfPeople);
    self.sliderLabel.text = [NSString stringWithFormat:@"%i", sliderCurrentValue];
    
    [self.billAmountTextField resignFirstResponder];
}


- (IBAction)calculateSplitAmount:(id)sender {
    [self getUsersAmountInput];
    
    //TODO: Fix crash when billAmountInDollars = 0
    self.eachPersonPays = [self.billAmountInDollars decimalNumberByDividingBy:self.numberOfPeople];
    
    NSLog(@"Each person pays: %@", self.eachPersonPays);
    
    //round to 2 decimal places
    NSDecimalNumberHandler *behavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain
                                                                                              scale:2
                                                                                   raiseOnExactness:NO
                                                                                    raiseOnOverflow:NO
                                                                                   raiseOnUnderflow:NO
                                                                                raiseOnDivideByZero:NO];
    
    NSDecimalNumber *roundedNumber = [self.eachPersonPays decimalNumberByRoundingAccordingToBehavior:behavior];
    NSLog(@"rounded number is %@", roundedNumber);
    
    NSString *eachPersonPaysString = [NSString stringWithFormat:@"Each person pays: %@", roundedNumber];
    
    [self.showResult setText:eachPersonPaysString];
    
    [self.billAmountTextField setText:@""];
    
    [self.billAmountTextField resignFirstResponder];
    

}

- (void)setupTextField
{
    // set the keyboard type to phonePad
    self.billAmountTextField.keyboardType = UIKeyboardTypePhonePad;
    self.billAmountTextField.clearButtonMode = UITextFieldViewModeUnlessEditing;

}

@end
