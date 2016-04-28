//
//  Car.h
//  CarInit
//
//  Created by qingyun on 16/1/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Tire, Engine;

@interface Car : NSObject

@property (nonatomic, strong) NSString *brand;
@property (nonatomic) int price;
@property (nonatomic, strong) NSMutableArray *tires;
@property (nonatomic, strong) Engine *engine;

- (instancetype)initWithBrand:(NSString *)brand andPrice:(int)price;

- (instancetype)initWithTires:(NSMutableArray *)tires;
- (instancetype)initWithEngine:(Engine *)engine;
- (instancetype)initWithTires:(NSMutableArray *)tires andEngine:(Engine *)engine;

@end
