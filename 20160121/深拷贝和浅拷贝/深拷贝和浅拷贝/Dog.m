//
//  Dog.m
//  深拷贝和浅拷贝
//
//  Created by qingyun on 16/1/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Dog.h"

@implementation Dog

- (instancetype)copyWithZone:(NSZone *)zone
{
    Dog *dogCopy = [[Dog allocWithZone:zone] init];
    return dogCopy;
}

- (instancetype)mutableCopyWithZone:(NSZone *)zone
{
    Dog *dogCopy = [[Dog allocWithZone:zone] init];
    return dogCopy;
}

@end
