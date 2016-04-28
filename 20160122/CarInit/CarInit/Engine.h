//
//  Engine.h
//  CarInit
//
//  Created by qingyun on 16/1/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Engine : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) float power;

- (instancetype)initWithName:(NSString *)name andPower:(float)power;

@end
