//
//  Register.m
//  使用block块完成登陆和注册的回调
//
//  Created by qingyun on 16/1/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Register.h"

@implementation Register

- (void)registWithName:(NSString *)username andPassword:(NSString *)password andID:(NSString *)ID
{
    // 把 username、password、ID写入数据库
    self.block(username, password, YES); // 开始回调
    NSLog(@"用户信息录入成功，即将跳往登陆界面...");
}

@end
