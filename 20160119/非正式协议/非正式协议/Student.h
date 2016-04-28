//
//  Student.h
//  非正式协议
//
//  Created by qingyun on 16/1/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Person.h"
#import "Teacher.h"

@interface Student : Person

@property (nonatomic, strong) Teacher *teacher;
@property (nonatomic, strong) id delegate;

- (instancetype)initWithDelegate:(id)delegate;

- (void)sleep;

@end
