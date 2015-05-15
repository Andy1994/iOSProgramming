//
//  EditorViewController.m
//  ModalEditor
//
//  Created by 王文博 on 15-4-29.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import "EditorViewController.h"

@interface EditorViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailField;

@end

@implementation EditorViewController

- (IBAction)hideKeyboard:(id)sender {
    [self.emailField resignFirstResponder];
}

- (IBAction)updateEditor:(id)sender {
    ((ViewController *)self.presentingViewController).emailLabel.text = self.emailField.text;
    //[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.emailField.text = ((ViewController *)self.presentingViewController).emailLabel.text;
}

@end
