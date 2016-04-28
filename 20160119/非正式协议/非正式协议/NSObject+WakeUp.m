//
//  NSObject+WakeUp.m
//  非正式协议
//
//  Created by qingyun on 16/1/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "NSObject+WakeUp.h"

static int count=0;

@implementation NSObject (WakeUp)



- (void)wakeUp:(NSTimer *)timer
{   count++;
    NSLog(@"%d",count);
    
    if (count == 5) {
        // KVC 或者userinfo使用字典
        NSLog(@"%@: >>>%@<<<<醒一醒，发红包了....", [self class], timer.userInfo);
        [timer invalidate];
    }
}

@end
