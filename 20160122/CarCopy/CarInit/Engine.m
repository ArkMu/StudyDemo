//
//  Engine.m
//  CarInit
//
//  Created by qingyun on 16/1/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Engine.h"

@implementation Engine

- (instancetype)copyWithZone:(NSZone *)zone
{
    Engine *engineCopy = [[[self class] allocWithZone:zone] init];
    engineCopy.name = self.name;
    engineCopy.power = self.power;
    return engineCopy;
}

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
