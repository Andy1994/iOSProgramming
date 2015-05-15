//
//  ViewController.m
//  Scroller
//
//  Created by 王文博 on 15-4-28.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *theScroll;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.theScroll.contentSize = CGSizeMake(280.0, 1000.0);
}

@end
