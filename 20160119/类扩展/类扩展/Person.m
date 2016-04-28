//
//  Person.m
//  类扩展
//
//  Created by qingyun on 16/1/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Person.h"
#import "Person_Bar.h"

int num = 100;

// 私有的类
@interface School : NSObject

@property (nonatomic, strong) NSString *name;

@end

@implementation School

- (instancetype)init
{
    if (self = [super init]) {
        _name = @"青云";
    }
    return self;
}

@end

// 私有的类别
@interface NSString (LenthNumber)

- (NSNumber *)lengthAsNumber;

@end

@implementation NSString  (LenthNumber)

- (NSNumber *)lengthAsNumber
{
    NSUInteger length = [self length];
    return @(length);
}

@end

// 这是一个类扩展（Extension）,写在类的内部表示对该类的扩展，它扩展的的内容都是私有的概念
@interface Person ()

{
    BOOL _sex;
//    School *_school;
}

@property (nonatomic, strong) School *school;
@property (nonatomic, strong) NSString *home;
@property (nonatomic, strong, readwrite) NSString *ID;

//- (void)foo;

@end

@implementation Person

- (instancetype)init
{
    if (self = [super init]) {
        self.ID = @"4100000";
        self.home = @"xxxxxx";
        _sex = YES;
        self.school.name = @"青云信息技术有限公司";
        self.girlFriend.name = @"xiaohong";
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name
{
    if (self = [super init]) {
        _name = name;
    }
    return self;
}

- (Person *)girlFriend
{
    if (_girlFriend == nil) {
        _girlFriend = [[Person alloc] initWithName:@"小红"];
    }
    return _girlFriend;
}

- (School *)school
{
    if (_school == nil) {
        _school = [School new];
    }
    return _school;
}

- (void)introduce
{
    [self foo];
    NSLog(@"name : %@ id: %@ home : %@", _name, _ID, _home);
}

// 一般的私有的方法都不需要声明
- (void)foo
{
    NSLog(@"dosome........");
}

@end
