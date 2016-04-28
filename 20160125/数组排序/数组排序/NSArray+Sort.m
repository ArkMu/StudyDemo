//
//  NSArray+Sort.m
//  数组排序
//
//  Created by qingyun on 16/1/25.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "NSArray+Sort.h"

@implementation NSArray (Sort)

- (NSArray *)sortByBLock:(NSComparisonResult (^)(id, id))block
{
    NSUInteger m,n;
    
    NSMutableArray *arrCopy = [self mutableCopy];
    
    // 冒泡
    for (m=0; m < arrCopy.count-1; m++) {
        for (n=0; n < arrCopy.count-1-m; n++) {
            if (block(arrCopy[n], arrCopy[n+1]) == NSOrderedDescending) {
                [arrCopy exchangeObjectAtIndex:n withObjectAtIndex:n+1];
            }
        }
    }
    
    return arrCopy;
}

@end










