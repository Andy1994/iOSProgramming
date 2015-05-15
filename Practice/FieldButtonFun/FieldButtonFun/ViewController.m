//
//  ViewController.m
//  FieldButtonFun
//
//  Created by 王文博 on 15-4-28.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *thePlace;
@property (weak, nonatomic) IBOutlet UITextField *theVerb;
@property (weak, nonatomic) IBOutlet UITextField *theNumber;
@property (weak, nonatomic) IBOutlet UITextView *theTemplate;
@property (weak, nonatomic) IBOutlet UITextView *theStory;

@end

@implementation ViewController

- (IBAction)hideKeyboard:(id)sender {
    [self.thePlace resignFirstResponder];
    [self.theVerb resignFirstResponder];
    [self.theNumber resignFirstResponder];
    [self.theTemplate resignFirstResponder];
}

- (IBAction)creatStory:(id)sender {
    self.theStory.text = [self.theTemplate.text stringByReplacingOccurrencesOfString:@"<place>" withString:self.thePlace.text];
    self.theStory.text = [self.theStory.text stringByReplacingOccurrencesOfString:@"<verb>" withString:self.theVerb.text];
    self.theStory.text = [self.theStory.text stringByReplacingOccurrencesOfString:@"<number>" withString:self.theNumber.text];
}

@end
