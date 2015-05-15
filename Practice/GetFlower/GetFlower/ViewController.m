//
//  ViewController.m
//  GetFlower
//
//  Created by 王文博 on 15-4-28.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorChoice;
@property (weak, nonatomic) IBOutlet UIWebView *flowerView;
@property (weak, nonatomic) IBOutlet UIWebView *flowerDetailView;

@end

@implementation ViewController

- (IBAction)getFlower:(id)sender {
    NSString *color = [self.colorChoice titleForSegmentAtIndex:self.colorChoice.selectedSegmentIndex];
    int session = random() % 50000;
    
    NSURL *imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.floraphotographs.com/showrandomios.php?color=%@&session=%d",color,session]];
    NSURL *detailURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.floraphotographs.com/detailios.php?session=%d",session]];
    [self.flowerView loadRequest:[NSURLRequest requestWithURL:imageURL]];
    [self.flowerDetailView loadRequest:[NSURLRequest requestWithURL:detailURL]];
}

- (IBAction)toggleFlowerDetail:(id)sender {
    self.flowerDetailView.hidden = ![sender isOn];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.flowerDetailView.hidden = YES;
    [self getFlower:nil];
}
@end
