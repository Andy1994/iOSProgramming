//
//  ViewController.m
//  ServerTest
//
//  Created by 王文博 on 15-5-1.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@end

@implementation ViewController

- (IBAction)connection:(id)sender {
    NSString *name = @"wdabo";
    NSString *password = @"12345";
    NSString *post = [NSString stringWithFormat:@"name=%@&password=%@",name,password];
    //NSLog(@"post:%@",post);
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
    //NSLog(@"postLength=%@",postLength);
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://caoapp.sinaapp.com/login.php"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    NSHTTPURLResponse* urlResponse = nil;
    NSError *error = nil;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    //NSLog(@"user login check result:%@",result);
    self.outputLabel.text = [self.outputLabel.text stringByAppendingString:result];
}

@end
