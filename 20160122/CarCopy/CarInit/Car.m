//
//  Car.m
//  CarInit
//
//  Created by qingyun on 16/1/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Car.h"

#import "Engine.h"

@implementation Car

- (instancetype)copyWithZone:(NSZone *)zone
{
    Car *carCopy = [[[self class] allocWithZone:zone] init];
    carCopy.brand = self.brand;
    carCopy.price = self.price;
    carCopy.tires = [self.tires mutableCopy];
    carCopy.engine = [self.engine copy];
    return carCopy;
}

- (instancetype)initWithBrand:(NSString *)brand andPrice:(int)price
{
    if (self = [super init]) {
        _brand = brand;
        _price = price;
    }
    return self;
}

// 便利
- (instancetype)initWithEngine:(Engine *)engine
{
    if (self = [self initWithBrand:@"Benz" andPrice:200000]) {
        _engine = engine;
    }
    return self;
}

- (instancetype)initWithTires:(NSMutableArray *)tires
{
    if (self = [self initWithBrand:@"Benz" andPrice:200000]) {
        _tires = tires;
    }
    return self;
}

- (instancetype)initWithTires:(NSMutableArray *)tires andEngine:(Engine *)engine
{
    if (self = [self initWithBrand:@"BMW" andPrice:200000]) {
        _tires = tires;
        _engine = engine;
    }
    return self;
}

- (NSString *)description
{
    NSMutableString *desc = [NSMutableString stringWithFormat:@"品牌：%@ 价格：%d", _brand, _price];
    
    [desc appendFormat:@"\n引擎：%@", _engine];
    
    for (Tire *t in _tires) {
        [desc appendFormat:@"\n轮胎:%@", t];
    }
    
    return desc;
}

@end
