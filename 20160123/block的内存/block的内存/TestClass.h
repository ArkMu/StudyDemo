//
//  TestClass.h
//  block的内存
//
//  Created by qingyun on 16/1/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestClass : NSObject

// 1. 在 block当做属性使用时尽量使用copy
@property (nonatomic, copy) void (^printBlock)(void);

- (void)print;

@end
