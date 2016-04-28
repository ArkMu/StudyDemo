//
//  main.m
//  数组排序
//
//  Created by qingyun on 16/1/25.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSArray+Sort.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray *arr = @[@1000,@2000,@12345,@90,@12451];
        
//        NSLog(@"ARR >>> %@", [arr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
//            return [obj1 compare:obj2];
//        }]);
//        
        
        
        
        NSLog(@"ARR >>> %@", [arr sortByBLock:^NSComparisonResult(id obj1, id obj2) {
            return [obj1 compare:obj2];
        }]);
        
    }
    return 0;
}
