//
//  main.m
//  使用block块完成登陆和注册的回调
//
//  Created by qingyun on 16/1/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Login.h"
#import "Register.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Login *lg = [Login new];
        [lg welcome];
        
        NSLog(@"去注册");
        Register *reg = [Register new];
        [lg gotoRegister:reg];
        
        [reg registWithName:@"xiaoming" andPassword:@"123456" andID:@"000000009527"];
        
        [lg login];
    }
    return 0;
}
