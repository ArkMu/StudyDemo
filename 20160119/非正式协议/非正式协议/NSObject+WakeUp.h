//
//  NSObject+WakeUp.h
//  非正式协议
//
//  Created by qingyun on 16/1/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (WakeUp)

- (void)count;
- (void)wakeUp:(NSTimer *)timer;

@end
