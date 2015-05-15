//
//  ViewController.h
//  DateCalc
//
//  Created by 王文博 on 15-4-30.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateChooserViewController.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (nonatomic) Boolean dateChooserVisible;
- (void)calculateDateDifference:(NSDate *)chosenDate;
@end
