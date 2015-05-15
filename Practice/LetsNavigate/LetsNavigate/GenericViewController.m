//
//  GenericViewController.m
//  LetsNavigate
//
//  Created by 王文博 on 15-4-30.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import "GenericViewController.h"

@interface GenericViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@end

@implementation GenericViewController

- (IBAction)incrementCount:(id)sender {
    ((CountingNavigatorController *)self.parentViewController).pushCount++;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.countLabel.text = [NSString stringWithFormat:@"%d",((CountingNavigatorController *)self.parentViewController).pushCount];
}

@end
