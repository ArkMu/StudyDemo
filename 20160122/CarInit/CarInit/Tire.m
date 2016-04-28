//
//  Tire.m
//  CarInit
//
//  Created by qingyun on 16/1/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Tire.h"

@implementation Tire

- (instancetype)initWithBrand:(NSString *)brand
{
    if (self = [super init]) {
        _brand = brand;
    }
    return self;
}

- (instancetype)initWithPressure:(int)pressure andTireDeepth:(float)tireDeepth
{
    if (self = [self initWithBrand:@"米其林"]) {
        _pressure = pressure;
        _tireDeepth = tireDeepth;
    }
    return self;
}

- (NSString *)description
{
    NSString *desc = [NSString stringWithFormat:@"胎压：%d 花纹深度：%.2f", _pressure, _tireDeepth];
    return desc;
}

@end
