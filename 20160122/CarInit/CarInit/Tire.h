//
//  Tire.h
//  CarInit
//
//  Created by qingyun on 16/1/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tire : NSObject

@property (nonatomic, strong) NSString *brand;
@property (nonatomic) int pressure;
@property (nonatomic) float tireDeepth;

- (instancetype)initWithBrand:(NSString *)brand;
- (instancetype)initWithPressure:(int)pressure andTireDeepth:(float)tireDeepth;

@end
