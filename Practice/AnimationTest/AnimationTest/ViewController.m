//
//  ViewController.m
//  AnimationTest
//
//  Created by 王文博 on 15-5-5.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) UIView *squareView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	CALayer *squareLayer = [CALayer layer];
    squareLayer.backgroundColor = [[UIColor redColor] CGColor];
    squareLayer.frame = CGRectMake(100, 100, 20, 20);
    [self.view.layer addSublayer:squareLayer];
    
    _squareView = [UIView new];
    _squareView.backgroundColor = [UIColor blueColor];
    _squareView.frame = CGRectMake(200, 100, 20, 20);
    [self.view addSubview:_squareView];
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(drop:)]];
}

- (void)drop:(UIGestureRecognizer *)recognizer
{
    NSArray *layers = self.view.layer.sublayers;
    CALayer *layer = [layers objectAtIndex:0];
    [layer setPosition:CGPointMake(200, 250)];
    
    NSArray *views = self.view.subviews;
    UIView *view = [views objectAtIndex:0];
    [view setCenter:CGPointMake(100, 250)];
    [self.squareView setCenter:CGPointMake(100, 250)];
    NSLog(@"YES!");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
