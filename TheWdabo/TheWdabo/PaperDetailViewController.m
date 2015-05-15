//
//  PaperDetailViewController.m
//  TheWdabo
//
//  Created by 王文博 on 15-5-8.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import "PaperDetailViewController.h"

@interface PaperDetailViewController ()
@end

@implementation PaperDetailViewController
@synthesize html,title2,time2,tag;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.papertitle.text = title2;
    self.papertime.text = time2;
    [self.paperwebView loadHTMLString:html baseURL:nil];
}

- (IBAction)doEdit:(id)sender {
    UIActionSheet *actionSheet;
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"选择操作"
                                              delegate:self
                                     cancelButtonTitle:@"取消"
                                destructiveButtonTitle:@"删除"
                                     otherButtonTitles:@"修改", nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    [actionSheet showFromRect:self.view.frame
                       inView:self.view
                     animated:YES];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if([buttonTitle isEqualToString:@"删除"])
    {
        [self deletePaper];
    }
    else if([buttonTitle isEqualToString:@"修改"])
    {
        
    }
}

- (void)deletePaper
{
    NSString *post = [NSString stringWithFormat:@"tag=%d",tag];
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://wdabo.sinaapp.com/API/deletePaperAPI.php"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    
    dispatch_queue_t getPaper = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(getPaper, ^{
        NSHTTPURLResponse* urlResponse = nil;
        NSError *error = nil;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
        NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];

        dispatch_async(dispatch_get_main_queue(), ^{
            if([result isEqualToString:@"YES"])
            {
                [self showSuccessOrFailed:1];
            }
            else if([result isEqualToString:@"NO"])
            {
                [self showSuccessOrFailed:0];
            }
        });
    });
}

- (void)showSuccessOrFailed:(int)SOF
{
    UILabel *showlab=[[UILabel alloc]initWithFrame:CGRectMake(60, 400, 200, 20)];
    showlab.textAlignment = NSTextAlignmentCenter;
    showlab.textColor = [UIColor colorWithRed:225/255 green:229/255 blue:239/255 alpha:0.5];
    if(SOF == 1)
    {
        [showlab setText:@"删除成功"];
    }
    else
    {
        [showlab setText:@"服务器连接失败"];
    }
    //[showlab setBackgroundColor:[UIColor colorWithRed:189/255 green:206/255 blue:255/255 alpha:1]];
    [self.view addSubview:showlab];
    showlab.alpha=1.0;
    //简单的动画效果
    [UIView animateWithDuration:1.0 animations:^{
        showlab.alpha=0;
    } completion:^(BOOL finished) {
        [showlab removeFromSuperview];
        if(SOF == 1)[self performSegueWithIdentifier:@"backPaper" sender:self];
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PaperViewController *toView = (PaperViewController *)segue.destinationViewController;
    toView.shouldReflash = YES;
}

@end
