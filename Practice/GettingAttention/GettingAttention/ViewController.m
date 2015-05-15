//
//  ViewController.m
//  GettingAttention
//
//  Created by 王文博 on 15-4-29.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *userOutput;

@end

@implementation ViewController

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if([buttonTitle isEqualToString:@"Destory"])
    {
        self.userOutput.text = @"Clicked 'Destory'";
    }
    else if([buttonTitle isEqualToString:@"Negotiate"])
    {
        self.userOutput.text = @"Clicked 'Negotiate'";
    }
    else if([buttonTitle isEqualToString:@"Compromise"])
    {
        self.userOutput.text = @"Clicked 'Compromise'";
    }
    else self.userOutput.text = @"Clicked 'Cancel'";
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if([alertView.title isEqualToString:@"Alert Button Selected"])
    {
        if([buttonTitle isEqualToString:@"Never mind!"])
        {
            self.userOutput.text = @"Clicked 'Never mind!'";
        }
        else if([buttonTitle isEqualToString:@"Fuck you!"])
        {
            self.userOutput.text = @"Clicked 'Fuck you!'";
        }
        else self.userOutput.text = @"Clicked 'OK'";
    }
    
    if([alertView.title isEqualToString:@"Email Address"])
    {
        self.userOutput.text = [[alertView textFieldAtIndex:0] text];
    }
}

- (IBAction)doAlert:(id)sender {
    UIAlertView *alertDialog;
    alertDialog = [[UIAlertView alloc] initWithTitle:@"Alert Button Selected"
                                             message:@"I need your attention NOW!"
                                            delegate:nil
                                   cancelButtonTitle:@"OK"
                                   otherButtonTitles:nil];
    [alertDialog show];
}

- (IBAction)doMultiButtonAlert:(id)sender {
    UIAlertView *alertDialog;
    alertDialog = [[UIAlertView alloc] initWithTitle:@"Alert Button Selected"
                                             message:@"I need your attention NOW!"
                                            delegate:self
                                   cancelButtonTitle:@"OK"
                                   otherButtonTitles:@"Never mind!",@"Fuck you!",nil];
    [alertDialog show];
}

- (IBAction)doAlertInput:(id)sender {
    UIAlertView *alertDialog;
    alertDialog = [[UIAlertView alloc] initWithTitle:@"Email Address"
                                             message:@"Please enter your email address:"
                                            delegate:self
                                   cancelButtonTitle:@"OK"
                                   otherButtonTitles:nil];
    alertDialog.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alertDialog show];
}

- (IBAction)doActionSheet:(id)sender {
    UIActionSheet *actionSheet;
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"Available Action"
                                              delegate:self
                                     cancelButtonTitle:@"Cancel"
                                destructiveButtonTitle:@"Destory"
                                     otherButtonTitles:@"Negotiate",@"Compromise", nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    [actionSheet showFromRect:[(UIButton *)sender frame]
                       inView:self.view
                     animated:YES];
}

- (IBAction)doSound:(id)sender {
    SystemSoundID soundID;
    NSString *soundFile = [[NSBundle mainBundle] pathForResource:@"soundeffect" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundFile],&soundID);
    AudioServicesPlaySystemSound(soundID);
}

- (IBAction)doAlertSound:(id)sender {
    SystemSoundID soundID;
    NSString *soundFile = [[NSBundle mainBundle] pathForResource:@"alertsound" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundFile],&soundID);
    AudioServicesPlayAlertSound(soundID);
}

- (IBAction)doVibration:(id)sender {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

@end
