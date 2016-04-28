//
//  NSArray+Sort.h
//  数组排序
//
//  Created by qingyun on 16/1/25.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Sort)

- (NSArray *)sortByBLock:(NSComparisonResult (^)(id obj1, id obj2))block;

@end
