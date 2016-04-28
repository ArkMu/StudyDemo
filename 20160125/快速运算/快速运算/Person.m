//
//  Person.m
//  KVC用法
//
//  Created by qingyun on 16/1/25.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithMoney:(int)money
{
    if (self = [super init]) {
        _money = money;
    }
    return self;
}

@end
