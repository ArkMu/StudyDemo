//
//  XiaoMing.m
//  block块
//
//  Created by qingyun on 16/1/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "XiaoMing.h"

@implementation XiaoMing

- (instancetype)initWithName:(NSString *)name
{
    if (self = [super init]) {
        _name = name;
    }
    return self;
}

- (void)repeat:(void (^)(void))sayBlock
{
    [self sleep];
    sayBlock();
    [self sleep];
    sayBlock();
    sayBlock();
    sayBlock();
    sayBlock();
    sayBlock();
}

- (void)sleep
{
    NSLog(@"睡一会");
}

- (NSString *)description
{
    return [@(_age) stringValue];
}


@end
