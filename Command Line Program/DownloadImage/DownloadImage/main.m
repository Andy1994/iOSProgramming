//
//  main.m
//  DownloadImage
//
//  Created by 王文博 on 15-4-26.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSURL *url = [NSURL URLWithString:@"http://wdabo-file.stor.sinaapp.com/Game3.png"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSError *error = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:NULL
                                                         error:&error];
        if(!data)
        {
            NSLog(@"fetch failed: %@",[error localizedDescription]);
            return 1;
        }
        
        NSLog(@"%lu bytes",[data length]);
        
        BOOL written = [data writeToFile:@"/tmp/wdabo.png"
                                 options:NSDataWritingAtomic
                                   error:&error];
        if(!written)
        {
            NSLog(@"write failed: %@",[error localizedDescription]);
        }
        
        NSLog(@"Success!");
    }
    return 0;
}

