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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)getBillAmount:(UITextField *)sender {
    
    
}
- (IBAction)getNumberOfPeople:(UISlider *)sender {
    int sliderCurrentValue = sender.value;
    
    self.sliderLabel.text = [NSString stringWithFormat:@"%i", sliderCurrentValue];
}

- (IBAction)calculateSplitAmount:(UIButton *)sender {
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
