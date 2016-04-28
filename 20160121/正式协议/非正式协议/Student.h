//
//  Student.h
//  非正式协议
//
//  Created by qingyun on 16/1/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Person.h"
#import "Teacher.h"
#import "WakeUp1.h"

@interface Student : Person

@property (nonatomic, strong) Teacher *teacher;
@property (nonatomic, strong) id <WakeUp1, WakeUp> delegate; // 表示明确需要delegate遵循这个 叫 wakeUp的协议

- (instancetype)initWithDelegate:(id)delegate;

- (void)sleep;

@end
