//
//  DateChooserViewController.m
//  DateCalc
//
//  Created by 王文博 on 15-4-30.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import "DateChooserViewController.h"

@interface DateChooserViewController ()

@end

@implementation DateChooserViewController

- (IBAction)setDateTime:(id)sender {
    [(ViewController *)self.delegate calculateDateDifference:((UIDatePicker *)sender).date];
}

- (IBAction)dismissDateChooser:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    ((ViewController *)self.delegate).dateChooserVisible = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [(ViewController *)self.delegate calculateDateDifference:[NSDate date]];
}

@end
