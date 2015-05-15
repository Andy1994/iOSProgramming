//
//  PaperViewController.m
//  TheWdabo
//
//  Created by 王文博 on 15-5-7.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import "PaperViewController.h"
#import "PaperDetailView.h"

@interface PaperViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *PaperScrollView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *mySpinner;
@property (nonatomic) NSArray *paper;
@property (nonatomic) int toTag;
@end

@implementation PaperViewController
@synthesize toTag;

- (IBAction)refresh:(id)sender {
    [self clearScrollView];
    [self loadPaper];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadPaper];
}

- (void)viewDidAppear:(BOOL)animated
{
    if(self.shouldReflash)
    {
        [self clearScrollView];
        [self loadPaper];
        self.shouldReflash = NO;
    }
}

- (void)clearScrollView
{
    for(UIView *view in self.PaperScrollView.subviews)
    {
        [view removeFromSuperview];
    }
}

- (void)loadPaper
{
    if([self.paper count])
    {
        self.paper = nil;
    }
    [self.mySpinner startAnimating];
    NSString *post = @"Yes=1";
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://wdabo.sinaapp.com/API/showPaperAPI.php"]];
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
        self.paper = [result componentsSeparatedByString:@","];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self showPaper];
        });
    });
}

- (void)showPaper
{
    CGFloat paperWidth = 300;
    CGFloat paperHeight = 150;
    CGFloat marginLeft = (self.view.frame.size.width - paperWidth)/2;
    CGFloat marginTop = 13;
    
    //储存paperCount到首选项
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:[self.paper count]/4 forKey:@"paperCount"];
    [userDefaults synchronize];
    
    for(int i=0;i<[self.paper count]/4;i++)
    {
        CGFloat paperY = marginTop+(marginTop+paperHeight)*i;
        NSArray *paper = [[NSBundle mainBundle] loadNibNamed:@"Paper" owner:nil options:nil];
        PaperDetailView *paperOne = [paper firstObject];
        paperOne.frame = CGRectMake(marginLeft, paperY, paperWidth, paperHeight);
        
        paperOne.PaperTitleLabel.text = [self.paper objectAtIndex:i*4+1];
        paperOne.PaperTimeLabel.text = [self.paper objectAtIndex:i*4+2];
        paperOne.PaperTextView.text = [self.paper objectAtIndex:i*4+3];
        //paperOne.PaperButton.tag = [[self.paper objectAtIndex:i*4] intValue];
        paperOne.PaperButton.tag = i;
        [paperOne.PaperButton addTarget:self action:@selector(PaperSugue:) forControlEvents:UIControlEventTouchUpInside];
        [self.PaperScrollView addSubview:paperOne];
    }
    self.PaperScrollView.contentSize = CGSizeMake(self.view.frame.size.width, (marginTop + paperHeight)*([self.paper count]/4));
    [self.mySpinner stopAnimating];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PaperDetailViewController *toView = (PaperDetailViewController *)segue.destinationViewController;
    toView.title2 = [self.paper objectAtIndex:toTag*4+1];
    toView.time2 = [self.paper objectAtIndex:toTag*4+2];
    toView.html = [self.paper objectAtIndex:toTag*4+3];
    toView.tag = [[self.paper objectAtIndex:toTag*4] intValue];
}

- (void)PaperSugue:(UIButton *)btn
{
    toTag = btn.tag;

    [self performSegueWithIdentifier:@"toPaperDetail" sender:self];
}

- (IBAction)backPaper:(UIStoryboardSegue *)sender
{
    
}

@end
