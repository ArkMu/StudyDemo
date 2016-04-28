//
//  Engine.m
//  CarInit
//
//  Created by qingyun on 16/1/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Engine.h"

@implementation Engine

- (instancetype)initWithName:(NSString *)name andPower:(float)power
{
    if (self = [super init]) {
        _name = name;
        _power = power;
    }
    return self;
}

- (NSString *)description
{
    NSString *desc = [NSString stringWithFormat:@"品牌：%@ 动力：%.2f", _name, _power];
    return desc;
}

@end
