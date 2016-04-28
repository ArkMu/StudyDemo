//
//  WakeUp.h
//  非正式协议
//
//  Created by qingyun on 16/1/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

// 协议
// 协议实际上只是一个头文件而已，用来明确规定需要实现哪些行为
@protocol WakeUp <NSObject> //  这里的 <NSObject> 是协议，nsobject 协议规定了很多nsobject子类必须实现的行为，它与nsobject类中直接声明的方法的区别在与这些方法都必须有各个类自己实现，并且实现的做法往往都不一样

// 成员变量无法在协议中规定
//{
//    int num;
//}

// 协议中不只可以规定方法，还可以规定 属性
@property (nonatomic, strong) NSString *name;

// 协议中的方法默认是 必须实现的（@required）
@required
- (void)wakeUp:(NSTimer *)timer;
- (void)wakeUpToo;
- (void)doSomeThing3;
- (void)doSomeThing4;

// 可选的协议方法用@optional
@optional
- (void)doSomeThing;
- (void)doSomeThing1;
- (void)doSomeThing2;



@end
