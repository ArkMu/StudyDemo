 //
//  Woman.m
//  深拷贝和浅拷贝
//
//  Created by qingyun on 16/1/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Woman.h"

@implementation Woman

- (instancetype)copyWithZone:(NSZone *)zone
{
    // 为什么要使用[self class]
    // 因为子类用使用super来调用该逻辑时，必须明确知道该类的类型
    // 为什么说属性内存语意为copy时对象的引用计数要加1
    // 因为 alloc或者使用变量对copy对象进行强引用(retain)
    Woman *womanCopy = [[[self class] allocWithZone:zone] init];
    
    // 对于自定义的对象，拷贝的内容由拷贝的具体使用场景决定
    womanCopy.name = self.name;
    
    return womanCopy;
}

@end
