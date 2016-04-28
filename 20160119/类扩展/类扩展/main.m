//
//  main.m
//  类扩展
//
//  Created by qingyun on 16/1/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *p = [Person new];
        
        p.name = @"小明";
        p.age = 18;
        //p.ID = @"410000000";
        
        [p introduce];
        
    }
    return 0;
}
