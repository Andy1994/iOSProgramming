//
//  LoginViewController.m
//  TheWdabo
//
//  Created by 王文博 on 15-5-6.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UILabel *attentionLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (strong, nonatomic) IBOutlet UIView *rock;
@property (nonatomic) int rockDown;
@end

@implementation LoginViewController

- (IBAction)loginButton:(id)sender {
    [self.nameField resignFirstResponder];
    [self.passwordField resignFirstResponder];
    
    if([self.nameField.text isEqualToString:@""]||[self.passwordField.text isEqualToString:@""])
    {
        self.attentionLabel.text = @"登录名或密码不能为空！";
    }
    else{
        [self.spinner startAnimating];
        NSString *post = [NSString stringWithFormat:@"name=%@&password=%@",self.nameField.text,self.passwordField.text];
        //NSLog(@"post:%@",post);
        NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
        //NSLog(@"postLength=%@",postLength);
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:@"http://wdabo.sinaapp.com/API/loginAPI.php"]];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody:postData];
        
        dispatch_queue_t Login = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(Login, ^{
            NSHTTPURLResponse* urlResponse = nil;
            NSError *error = nil;
            NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
            NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
            //NSLog(@"%@",result);
            dispatch_async(dispatch_get_main_queue(), ^{
                if([result isEqualToString:@"No"])
                {
                    self.attentionLabel.text = @"登录名或密码错误！";
                }
                else if([result isEqualToString:@"Yes"])
                {
                    [self performSegueWithIdentifier:@"toMainPage" sender:self];
                }
                else self.attentionLabel.text = @"服务器连接错误！";
                [self.spinner stopAnimating];
            });
        });
    }
}

- (IBAction)laterButton:(id)sender {
    [self performSegueWithIdentifier:@"toMainPage" sender:self];
}

- (IBAction)clearAttentionLabel:(id)sender {
    self.attentionLabel.text = @"";
}

- (IBAction)doneInput:(id)sender {
    [self.nameField resignFirstResponder];
    [self.passwordField resignFirstResponder];
    if(![self.nameField.text  isEqual: @""] && ![self.passwordField.text  isEqual: @""])
    {
        [self loginButton:nil];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    /*
    [self.rock setFrame:CGRectMake(150, 50, 50, 50)];
    [UIView beginAnimations:@"rockMove" context:(__bridge void *)(self.rock)];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    //[UIView setAnimationDidStopSelector:@selector(showHideDidStop:finished:context:)];
    [self.rock setFrame:CGRectMake(150, 250, 100, 100)];
    [UIView commitAnimations];*/
    
    [UIView animateWithDuration:2
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState
                    animations:^{
                    [self.rock setCenter:CGPointMake(160, 40+30*1)];
                    }
                     completion:^(BOOL fin){
                         [UIView animateWithDuration:0.3
                                               delay:0
                                             options:UIViewAnimationOptionBeginFromCurrentState
                                          animations:^{
                                              //[self.rock setCenter:CGPointMake(160, 40+30*2)];
                                              CGAffineTransform transform = self.rock.transform;
                                              transform = CGAffineTransformRotate(transform, (M_PI/2));
                                              self.rock.transform = transform;
                                          }
                                          completion:^(BOOL fin){
                                              self.rockDown =3;
                                              [self rockMove];
                                          }
                          ];
                     }
     ];
}

- (void)rockMove
{
    [UIView animateWithDuration:2
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         [self.rock setCenter:CGPointMake(160, 40+30*self.rockDown)];
                     }
                     completion:^(BOOL fin){
                         ++self.rockDown;
                         [self rockMove];
                     }
     ];
}
@end
