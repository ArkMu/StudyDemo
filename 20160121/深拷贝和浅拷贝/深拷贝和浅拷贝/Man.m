//
//  Person.m
//  深拷贝和浅拷贝
//
//  Created by qingyun on 16/1/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Man.h"

@implementation Man

// 如果 在属性的内存语意中使用的是 copy，那么在set对象时就需要对对象进行 copy，并且把拷贝的结果赋给对应的成员变量
- (void)setName:(NSString *)name
{
//    _name = name;
    _name = [name copy];
}

// 当一个属性的内存语意是 copy 时，它生成的setter方法就长下面这样：⚠️⚠️⚠️⚠️
//- (void)setGirlFriend:(Womçan *)girlFriend
//{
//    _girlFriend = [girlFriend copy];
//}

@end
