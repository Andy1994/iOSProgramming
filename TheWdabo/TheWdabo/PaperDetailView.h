//
//  PaperDetailView.h
//  TheWdabo
//
//  Created by 王文博 on 15-5-7.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaperDetailView : UIView
@property (strong, nonatomic) IBOutlet UILabel *PaperTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *PaperTimeLabel;
@property (strong, nonatomic) IBOutlet UITextView *PaperTextView;
@property (strong, nonatomic) IBOutlet UIButton *PaperButton;

@end
