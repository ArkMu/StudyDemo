//
//  Student.m
//  非正式协议
//
//  Created by qingyun on 16/1/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Student.h"
//#import "NSObject+WakeUp.h"

@implementation Student

- (instancetype)initWithDelegate:(id)delegate
{
    if (self = [super init]) {
        _delegate = delegate;
    }
    return self;
}

#pragma mark - 学生行为

- (void)sleep
{
    NSLog(@"我开始睡觉，5小时后叫醒我.....");
    
    // 学生睡觉 需要老师来叫醒，这种现象就是一种代理的设计模式
    //[NSTimer scheduledTimerWithTimeInterval:5 target:self.delegate selector:@selector(wakeUp) userInfo:nil repeats:NO];
#if 1
    [NSTimer scheduledTimerWithTimeInterval:1 target:self.delegate selector:@selector(wakeUp:) userInfo:self.name repeats:YES];
#else 0
    //respondsToSelector:用来判断某个对象是否能影 响应/执行/调用 指定的方法
    // @selector(方法名字:)是响应选择器，用来表示一个方法
    // SEL 表示响应选择器的类型，可以用来作为方法变量的 类型 修饰
    SEL method = @selector(wakeUp1:);
    if ([self.delegate respondsToSelector:method]) {
        [NSTimer scheduledTimerWithTimeInterval:1 target:self.delegate selector:@selector(count) userInfo:nil repeats:YES];
        [NSTimer scheduledTimerWithTimeInterval:5 target:self.delegate selector:@selector(wakeUp1:) userInfo:self.name repeats:NO];
    } else {
        NSLog(@"你找别人做吧..");
    }
#endif
}

- (Teacher *)teacher
{
    if (_teacher == nil) {
        _teacher = [Teacher new];
    }
    return _teacher;
}

@end
