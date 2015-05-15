//
//  ViewController.h
//  ModalEditor
//
//  Created by 王文博 on 15-4-29.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)exitToHere:(UIStoryboardSegue *)sender;

@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@end
