//
//  MyPageViewController.m
//  TheWdabo
//
//  Created by 王文博 on 15-5-12.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import "MyPageViewController.h"

@interface MyPageViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *touXiang;
@property (strong, nonatomic) IBOutlet UILabel *paperCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *girlfriendLabel;
@property (strong, nonatomic) IBOutlet UILabel *companyLabel;
@property (strong, nonatomic) IBOutlet UILabel *jobLabel;

@end

@implementation MyPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.touXiang.layer.cornerRadius = self.touXiang.frame.size.width/2;
    self.touXiang.clipsToBounds = YES;
    self.touXiang.layer.borderWidth = 4.0f;
    self.touXiang.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.paperCountLabel.layer.cornerRadius = 7;
    self.paperCountLabel.clipsToBounds = YES;
    self.girlfriendLabel.layer.cornerRadius = 7;
    self.girlfriendLabel.clipsToBounds = YES;
    self.companyLabel.layer.cornerRadius = 7;
    self.companyLabel.clipsToBounds = YES;
    self.jobLabel.layer.cornerRadius = 7;
    self.jobLabel.clipsToBounds = YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.paperCountLabel.text = [NSString stringWithFormat:@"         Paper Count : %d",[userDefaults integerForKey:@"paperCount"]];
}

@end
