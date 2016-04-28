//
//  main.m
//  非正式协议
//
//  Created by qingyun on 16/1/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Teacher.h"
#import "Student.h"
#import "Clock.h"
#import "Phone.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Student *p = [Student new];
        Teacher *t = [Teacher new];
        p.name = @"小明";
        p.delegate = t;
        [p sleep];
        
        
        Student *p1 = [Student new];
        Clock *c = [Clock new];
        c.name = @"闹钟";
        p1.name = @"小红";
        p1.delegate = c;
        [p1 sleep];
        [p1.delegate wakeUpToo];
        
        Phone *tel = [Phone new];
        p1.delegate = tel;
        
        
        
        
        [[NSRunLoop mainRunLoop] run];
        
    }
    return 0;
}
