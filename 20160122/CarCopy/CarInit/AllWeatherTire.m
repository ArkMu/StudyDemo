//
//  AllWeatherTire.m
//  CarInit
//
//  Created by qingyun on 16/1/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "AllWeatherTire.h"

@implementation AllWeatherTire

- (instancetype)copyWithZone:(NSZone *)zone
{
    AllWeatherTire *awtireCopy = [super copyWithZone:zone];
    awtireCopy.rainHandling = self.rainHandling;
    awtireCopy.snowHandling = self.snowHandling;
    return awtireCopy;
}

- (instancetype)initWithrandHandling:(float)rainHandling andSnowHandling:(float)snowHandling
{
    if (self = [super initWithPressure:2 andTireDeepth:20.00F]) {
        _rainHandling = rainHandling;
        _snowHandling = snowHandling;
    }
    return self;
}

- (NSString *)description
{
    NSMutableString *desc = [NSMutableString stringWithString:[super description]];
    [desc appendFormat:@"雨天防滑力：%.2f 雪天防滑力：%.2f", _rainHandling, _snowHandling];
    return desc;
}

@end
