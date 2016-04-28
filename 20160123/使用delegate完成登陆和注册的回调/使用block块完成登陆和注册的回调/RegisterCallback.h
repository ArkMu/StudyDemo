//
//  RegisterCallback.h
//  使用block块完成登陆和注册的回调
//
//  Created by qingyun on 16/1/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RegisterCallback <NSObject>

- (void)takeRegisterInfo:(NSDictionary *)info;

@end
