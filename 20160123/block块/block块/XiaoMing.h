//
//  XiaoMing.h
//  block块
//
//  Created by qingyun on 16/1/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XiaoMing : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) int age;

- (instancetype)initWithName:(NSString *)name;

- (void)repeat:(void(^)(void))sayBlock;

@end
