//
//  ViewController.m
//  DownloadTest
//
//  Created by 王文博 on 15-5-13.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self downloadImage];
}

- (void)downloadImage
{
    NSURL *url = [NSURL URLWithString:@"http://wdabo-file.stor.sinaapp.com/Game3.png"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSError *error = nil;
    NSData  *data = [NSURLConnection sendSynchronousRequest:request
                                          returningResponse:nil
                                                      error:&error];
    if(data!=nil)
    {
        [data writeToFile:@"Game.png" atomically:YES];
    }
    else NSLog(@"%@",error);
    [self.imageView setImage:[UIImage imageWithData:data]];
}

@end
