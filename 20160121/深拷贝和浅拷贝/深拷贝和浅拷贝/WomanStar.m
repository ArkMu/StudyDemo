//
//  WomanStar.m
//  深拷贝和浅拷贝
//
//  Created by qingyun on 16/1/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "WomanStar.h"

@implementation WomanStar

- (instancetype)copyWithZone:(NSZone *)zone
{
    // 为什么要调用[super copyWithZone:zone]
    // 因为在拷贝时有很多成员变量已经在父类的这个方法中处理过逻辑了
    WomanStar *star = [super copyWithZone:zone];
    
    ///star.name = self.name;
   
    star.aliasName = [self.aliasName copy]; // star.aliasName = self.aliasName;
    star.dog = [self.dog copy];
    return star;
}

- (void)play
{
    NSLog(@"欧洲七日游");
}




@end
