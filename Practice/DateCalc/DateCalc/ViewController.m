//
//  ViewController.m
//  DateCalc
//
//  Created by 王文博 on 15-4-30.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)calculateDateDifference:(NSDate *)chosenDate
{
    NSDate *todaysDate;
    NSString *differenceOutput;
    NSString *todaysDateString;
    NSString *chosenDateString;
    NSDateFormatter *dateFormat;
    NSTimeInterval difference;
    
    todaysDate = [NSDate date];
    difference = [todaysDate timeIntervalSinceDate:chosenDate] / 86400;
    
    dateFormat = [NSDateFormatter new];
    [dateFormat setDateFormat:@"MMMM d, yyyy hh:mm:ssa"];
    todaysDateString = [dateFormat stringFromDate:todaysDate];
    chosenDateString = [dateFormat stringFromDate:chosenDate];
    
    differenceOutput = [NSString stringWithFormat:@"Difference between chosen date (%@) and today (%@) in days:%1.2f",chosenDateString,todaysDateString,fabs(difference)];
    self.outputLabel.text = differenceOutput;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ((DateChooserViewController *)segue.destinationViewController).delegate = self;
}

- (IBAction)showDateChooser:(id)sender {
    if(self.dateChooserVisible!=YES)
    {
        [self performSegueWithIdentifier:@"toDateChooser" sender:sender];
        self.dateChooserVisible = YES;
    }
}

@end
