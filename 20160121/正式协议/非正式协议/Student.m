//
//  Student.m
//  非正式协议
//
//  Created by qingyun on 16/1/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Student.h"

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
    NSLog(@"%@开始睡觉，5小时后叫醒我.....", self.name);
    
    // 学生睡觉 需要老师来叫醒，这种现象就是一种代理的设计模式
    //[NSTimer scheduledTimerWithTimeInterval:5 target:self.delegate selector:@selector(wakeUp) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:5 target:self.delegate selector:@selector(wakeUp:) userInfo:self.name repeats:NO];

}

- (Teacher *)teacher
{
    if (_teacher == nil) {
        _teacher = [Teacher new];
    }
    return _teacher;
}

@end
