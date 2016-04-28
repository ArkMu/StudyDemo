//
//  Login.m
//  使用block块完成登陆和注册的回调
//
//  Created by qingyun on 16/1/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Login.h"
#import "Register.h"

@implementation Login

- (void)welcome
{
    NSLog(@"欢迎光临...");
    NSLog(@"对不起，您需要注册才能登陆...");
}

- (void)gotoRegister:(Register *)regobj
{
    BOOL (^callback)(NSString*, NSString*, BOOL) = ^BOOL(NSString *un, NSString *pd, BOOL result){
        _username = un;
        _password = pd;
        return result;
    };
    
    regobj.block = callback;
}

- (void)login
{
    NSLog(@"%@(%@) 登陆成功！", _username, _password);
}


@end
