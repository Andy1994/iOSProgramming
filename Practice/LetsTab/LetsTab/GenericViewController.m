//
//  GenericViewController.m
//  LetsTab
//
//  Created by 王文博 on 15-4-30.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import "GenericViewController.h"

@interface GenericViewController ()
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (weak, nonatomic) IBOutlet UITabBarItem *barItem;

@end

@implementation GenericViewController

- (IBAction)incrementCountFirst:(id)sender {
    ((CountingTabBarController *)self.parentViewController).firstCount++;
    [self updateBadge];
    [self updateCounts];
}

- (IBAction)incrementCountSecond:(id)sender {
    ((CountingTabBarController *)self.parentViewController).secondCount++;
    [self updateBadge];
    [self updateCounts];
}

- (IBAction)incrementCountThird:(id)sender {
    ((CountingTabBarController *)self.parentViewController).thirdCount++;
    [self updateBadge];
    [self updateCounts];
}

- (void)updateCounts
{
    NSString *countString;
    countString = [NSString stringWithFormat:@"First: %d\nSecond: %d\nThird: %d",((CountingTabBarController *)self.parentViewController).firstCount,((CountingTabBarController *)self.parentViewController).secondCount,((CountingTabBarController *)self.parentViewController).thirdCount];
    self.outputLabel.text = countString;
}

- (void)updateBadge
{
    NSString *badgeCount;
    int currentBadge;
    currentBadge = [self.barItem.badgeValue intValue];
    currentBadge++;
    badgeCount = [NSString stringWithFormat:@"%d",currentBadge];
    self.barItem.badgeValue = badgeCount;
}
@end
