//
//  Student.h
//  KVC用法
//
//  Created by qingyun on 16/1/25.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;

@interface Student : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) int age;
@property (nonatomic) float height;
@property (nonatomic, strong, readonly) NSDate *birthday;
@property (nonatomic, strong) Person *friend;
@property (nonatomic, strong) NSMutableArray *friends;

@end
