//
//  Login.h
//  使用block块完成登陆和注册的回调
//
//  Created by qingyun on 16/1/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RegisterCallback.h"

@class Register;

@interface Login : NSObject <RegisterCallback>

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;

- (void)welcome;

- (void)gotoRegister:(Register *)regobj;

- (void)login;

@end
