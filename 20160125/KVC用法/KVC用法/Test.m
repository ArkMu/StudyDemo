//
//  Test.m
//  KVC用法
//
//  Created by qingyun on 16/1/25.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Test.h"

@implementation Test

- (void)print:(id)obj
{
    NSLog(@"name:%@ age:%@", [obj valueForKey:@"name"], [obj valueForKey:@"age"]);
}

@end
