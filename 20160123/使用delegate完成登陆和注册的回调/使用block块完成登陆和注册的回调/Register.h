//
//  Register.h
//  使用block块完成登陆和注册的回调
//
//  Created by qingyun on 16/1/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RegisterCallback.h"

@interface Register : NSObject

//@property (nonatomic, copy) BOOL (^block)(NSString *, NSString *, BOOL);

@property (nonatomic, strong) id <RegisterCallback> delegate;

- (void)registWithName:(NSString *)username andPassword:(NSString *)password andID:(NSString *)ID;

@end
