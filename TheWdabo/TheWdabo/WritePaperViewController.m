//
//  WritePaperViewController.m
//  TheWdabo
//
//  Created by 王文博 on 15-5-10.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import "WritePaperViewController.h"

@interface WritePaperViewController ()
@property (strong, nonatomic) IBOutlet UITextView *paperText;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *countWords;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@end

@implementation WritePaperViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.paperText.delegate = self;
    self.countWords.title = [NSString stringWithFormat:@"%d Words",[self.paperText.text length]];
}

- (IBAction)sendPaper:(id)sender {
    [self.paperText resignFirstResponder];
    [self.spinner startAnimating];
    NSArray *titleAndPaper = [self.paperText.text componentsSeparatedByString:@"@"];
    
    NSString *post = [NSString stringWithFormat:@"Title=%@&Article=%@",[titleAndPaper firstObject],[titleAndPaper lastObject]];
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://wdabo.sinaapp.com/API/savePaper.php"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    
    dispatch_queue_t sendPaper = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(sendPaper, ^{
        NSHTTPURLResponse* urlResponse = nil;
        NSError *error = nil;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
        __unused NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.spinner stopAnimating];
            //[self performSegueWithIdentifier:@"backPaper2" sender:self];
        });
    });

}

- (void)textViewDidChange:(UITextView *)textView
{
    self.countWords.title = [NSString stringWithFormat:@"%d Words",[textView.text length]];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    [textView resignFirstResponder];
}

- (IBAction)DoneEdit:(id)sender {
    [self.paperText resignFirstResponder];
}
@end
