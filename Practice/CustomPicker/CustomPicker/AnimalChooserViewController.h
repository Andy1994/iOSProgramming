//
//  AnimalChooserViewController.h
//  CustomPicker
//
//  Created by 王文博 on 15-4-30.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface AnimalChooserViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak,nonatomic) id delegate;

@end
