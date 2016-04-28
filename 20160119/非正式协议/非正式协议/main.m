//
//  main.m
//  非正式协议
//
//  Created by qingyun on 16/1/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Person.h"
#import "Student.h"
#import "Clock.h"
#import "Phone.h"
#import "NSObject+DoSome.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 非正式协议实际是对NSObject扩展的类别的独特叫法
        Person *p = [Person new];
        [p doSome];
     
        
        Phone *iPhone = [Phone new];
        Student *st = [[Student alloc] initWithDelegate:iPhone];
        [st doSome];
        
        Clock *clock = [Clock new];
        st.delegate = clock;
        st.name = @"小红";
        [st sleep];
        
        [[NSRunLoop mainRunLoop] run];
        
    }
    return 0;
}
