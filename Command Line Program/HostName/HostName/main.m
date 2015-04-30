//
//  main.m
//  HostName
//
//  Created by 王文博 on 15-4-24.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSHost *host = [NSHost currentHost];
        NSLog(@"%@",[host localizedName]);
        
    }
    return 0;
}

