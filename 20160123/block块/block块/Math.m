//
//  Math.m
//  block块
//
//  Created by qingyun on 16/1/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Math.h"

@implementation Math

- (instancetype)init
{
    if (self = [super init]) {
//        _result=0;
        _otherBlock = ^{
            _result = _firstNum+_secondNum;
        };
    }
    return self;
}

- (instancetype)initWithBlock:(int (^)(int, int))block
{
    if (self = [super init]) {
        _mathBlock = block;
    }
    return self;
}

@end
