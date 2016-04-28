//
//  AllWeatherTire.h
//  CarInit
//
//  Created by qingyun on 16/1/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Tire.h"

@interface AllWeatherTire : Tire

@property (nonatomic) float rainHandling;
@property (nonatomic) float snowHandling;

- (instancetype)initWithrandHandling:(float)rainHandling andSnowHandling:(float)snowHandling;

@end
