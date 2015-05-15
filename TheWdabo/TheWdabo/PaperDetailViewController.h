//
//  PaperDetailViewController.h
//  TheWdabo
//
//  Created by 王文博 on 15-5-8.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaperViewController.h"

@interface PaperDetailViewController : UIViewController <UIActionSheetDelegate>
@property (strong, nonatomic) IBOutlet UILabel *papertitle;
@property (strong, nonatomic) IBOutlet UILabel *papertime;
@property (strong, nonatomic) IBOutlet UIWebView *paperwebView;
@property (strong, nonatomic) NSString *html;
@property (strong, nonatomic) NSString *title2;
@property (strong, nonatomic) NSString *time2;
@property (nonatomic) int tag;
@end
