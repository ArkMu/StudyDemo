//
//  Person.m
//  初始化
//
//  Created by qingyun on 16/1/18.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init
{
    //if (self = [super  init]) {
    self = [super init]; // 调用[super init]的原因是要把从父类继承过来的成员变量赋值或做相关的初始化处理
    if (self != nil) {
        _name = @"QYStudent";
        _age = 20;
    }
    return self;
}

@end
