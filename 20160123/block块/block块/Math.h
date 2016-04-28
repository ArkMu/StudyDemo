//
//  Math.h
//  block块
//
//  Created by qingyun on 16/1/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Math : NSObject

@property (nonatomic) int firstNum;
@property (nonatomic) int secondNum;

@property (nonatomic) int result;

// block 作为对象也可以被其他对象来复合 注意类型和属性名字的写法
@property (nonatomic, copy) int (^mathBlock)(int,int);
@property (nonatomic, copy) void (^otherBlock)(void);

- (instancetype)initWithBlock:(int(^)(int, int))block;

@end
