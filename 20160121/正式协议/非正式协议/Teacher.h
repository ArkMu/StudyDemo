//
//  Teacher.h
//  非正式协议
//
//  Created by qingyun on 16/1/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Person.h"
#import "WakeUp1.h"

@interface Teacher : Person <WakeUp1> // 表示老师这个类明确 遵循 wakeup的协议

@end
