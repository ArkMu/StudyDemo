//
//  Student.m
//  KVC用法
//
//  Created by qingyun on 16/1/25.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Student.h"

#import "Person.h"

@interface Student ()

@property (nonatomic) int money;

@end

@implementation Student


- (instancetype)initWithDiction:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}


- (instancetype)init
{
    if (self = [super init]) {
        _birthday = [NSDate date];
    }
    return self;
}

- (Person *)friend
{
    if (_friend == nil) {
        _friend = [Person new];
    }
    return _friend;
}

- (NSMutableArray *)friends
{
    if (_friends == nil) {
        _friends = [NSMutableArray array];
    }
    return _friends;
}


// 如果在使用kvc时，使用到没有定义的键时，就会自动触发这个方法
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"xingming"]) {
        NSLog(@"小子算你幸运，这次不会出错了");
        [self setValue:value forKey:@"name"];
    }
}
- (id)valueForUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"xingming"]) {
        NSLog(@"涨点记性，下次让你崩");
    }
    return nil;
}

- (void)setNilValueForKey:(NSString *)key
{
    if ([key isEqualToString:@"age"]) {
        [self setValue:@0 forKey:@"age"];
    }
}

@end
