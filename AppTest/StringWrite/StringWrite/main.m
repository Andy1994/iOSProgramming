//
//  main.m
//  StringWrite
//
//  Created by 王文博 on 15-3-5.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSMutableString *str = [[NSMutableString alloc] init];
        for(int i = 0; i < 10; i++)
        {
            [str appendString:@"I'm Cool!\n"];
        }
        [str writeToFile:@"/tmp/Cool.txt" atomically:YES encoding:NSUTF8StringEncoding error:NULL];
        NSLog(@"Done!!!");
        
    }
    return 0;
}

