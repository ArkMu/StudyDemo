//
//  Person.m
//  KVC用法
//
//  Created by qingyun on 16/1/25.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name
{
    if (self = [super init]) {
        _name = name;
    }
    return self;
}

@end
