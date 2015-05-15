//
//  ViewController.m
//  caocaocao
//
//  Created by 王文博 on 15-5-1.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *testButton;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.testButton.layer.cornerRadius = 50;
}

- (IBAction)cao:(id)sender {
    //CGPoint *oldLocation = self.testButton.bounds.origin;
    CGRect buttonFrame = self.testButton.frame;
    buttonFrame.size.width = 150;
    buttonFrame.size.height = 150;
    self.testButton.frame = buttonFrame;
}
@end
