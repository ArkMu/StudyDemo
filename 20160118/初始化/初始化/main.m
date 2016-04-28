//
//  main.m
//  初始化
//
//  Created by qingyun on 16/1/18.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Person.h"
#import "Child.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *str = [NSString alloc];
        NSLog(@"str >>>> %p", str);
        str = [str initWithFormat:@"hello, %@",@"☀️"];
        NSLog(@"str >>>> %p", str);
        //Person *p = [Person new];
        
        Person *p = [[Person alloc] init]; // new ======= 先alloc 再init
        NSLog(@"name >>>> %@ age >>>> %d", p.name, p.age);
        
        Child *c = [[Child alloc] init];
        NSLog(@"name >>>> %@ age >>>> %d interest >>>> %@", c.name, c.age, c.interest);
        
        
    }
    return 0;
}
