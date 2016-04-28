//
//  TestClass.m
//  block的内存
//
//  Created by qingyun on 16/1/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "TestClass.h"

@implementation TestClass

- (instancetype)init
{
    if (self = [super init]) {
        // 2 为了避免在block内部对对象本身发生循环引用，需要在block内部使用self时进行弱引用修改
//        __weak TestClass *weakSelf = self;
         __weak typeof(self) weakSelf = self; // typeof(self) 可以获取到当前该对象的具体类型
        _printBlock = ^{
            NSLog(@"🌹🌹🌹%@", weakSelf);
        };
    
    }
    return self;
}

- (void)print
{
    _printBlock();
}

- (void)dealloc
{
    NSLog(@"挂了");
}

@end
