//
//  Download.m
//  DownloadTest
//
//  Created by 王文博 on 15-5-14.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import "Download.h"
typedef void(^ProgressBlock)(float percent);
@interface Download() <NSURLConnectionDataDelegate>
@property (nonatomic,strong)NSMutableData *dataM;
@property (nonatomic,strong)NSString *cachePath;
@property (nonatomic,assign)long long fileLength;
@property (nonatomic,assign)long long currentLength;
//回调块代码
@property (nonatomic,copy)ProgressBlock progress;
@end
@implementation Download

- (NSMutableData *)dataM
{
    if(!_dataM)
    {
        _dataM = [NSMutableData data];
    }
    return _dataM;
}

- (void)downloadWithURL:(NSURL *)url progress:(void (^)(float))progress
{
    self.progress = progress;
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    [connection setDelegateQueue:[[NSOperationQueue alloc]init]];
    [connection start];
}

// 1. 接收到服务器的响应，服务器执行完请求，向客户端回传数据
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"%@ %lld",response.suggestedFilename,response.expectedContentLength);
    //保存缓存路径
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    self.cachePath = [cachePath stringByAppendingPathComponent:response.suggestedFilename];
    self.fileLength = response.expectedContentLength;
    self.currentLength = 0;
    [self.dataM setData:nil];
}

// 2. 接收数据，从服务器接收到数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.dataM appendData:data];
    self.currentLength += data.length;
    float progress = (float)self.currentLength / self.fileLength;
    if(self.progress)
    {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate date]];
            self.progress(progress);
        }];
    }
}

// 3. 完成接收
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"%s %@",__func__,[NSThread currentThread]);
    [self.dataM writeToFile:self.cachePath atomically:YES];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@",error.localizedDescription);
}

@end
