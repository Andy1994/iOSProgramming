//
//  main.m
//  TimeZone
//
//  Created by 王文博 on 15-4-24.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSTimeZone *timezone = [NSTimeZone systemTimeZone];
        if([timezone isDaylightSavingTime])
        {
            NSLog(@"这是夏令时！");
        }
        else NSLog(@"这不是夏令时！");
    }
    return 0;
}

