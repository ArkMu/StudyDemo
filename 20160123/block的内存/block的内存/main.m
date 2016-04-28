//
//  main.m
//  block的内存
//
//  Created by qingyun on 16/1/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TestClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        {
            TestClass *tc = [TestClass new];
            [tc print];
        }
        
        
    }
    return 0;
}
