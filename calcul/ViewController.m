//
//  ViewController.m
//  calcul
//
//  Created by Luu Vinh Loc on 7/15/14.
//  Copyright (c) 2014 HEDSPI. All rights reserved.
//

#import "ViewController.h"
#import "CentralProcessingUnit.h"
#import "OperationReader.h"

@interface ViewController ()
{
    @private
    BOOL isTyping; // 0 = not typing
                   // 1 = typing
}

- (IBAction)digitTouch:(UIButton *)sender;
- (IBAction)operatorTouch:(UIButton *)sender;
- (IBAction)equalTouch:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *showOperationInput;
@property (weak, nonatomic) IBOutlet UILabel *showHistory;

@end

CentralProcessingUnit *processing;
OperationReader *reader;

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //set status is not typing
    isTyping=0;
    processing = [[CentralProcessingUnit alloc] init];
    reader = [[OperationReader alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)getTextInput{
    return [self.showOperationInput text];
}

- (void)setTextInput:(NSString *)text{
    [self.showOperationInput setText:text];
}


// called when a digit's button is touched
- (IBAction)digitTouch:(UIButton *)sender {
    NSMutableString *digit = [[NSMutableString alloc] init ];
    
    if(isTyping)
    {
        // add new digit into old digit
        [digit setString:(self.getTextInput)];
        [digit appendString:[[sender titleLabel] text]];
        //NSLog(@"digit: %@",digit);
        self.showOperationInput.text = digit;
    }else{
        isTyping = 1;
        [self setTextInput: [[sender titleLabel] text] ];
    }
}

- (IBAction)operatorTouch:(UIButton *)sender {
    NSMutableString *digit = [[NSMutableString alloc] init ];
    
    if(isTyping)
    {
        // add operator
        [digit setString:(self.getTextInput)];
        [digit appendString:[[sender titleLabel] text]];
        //NSLog(@"digit: %@",digit);
        self.showOperationInput.text = digit;
    }else{
        isTyping = 1;
        [self setTextInput:[[sender titleLabel] text]];
    }
}

- (IBAction)equalTouch:(UIButton *)sender {
    [reader read:[self getTextInput]];
   
    [processing process:reader->operatorArray numberArray:reader->numberArray];
    
    [self setTextInput:processing->resultString];
    isTyping = 0;
}


@end
