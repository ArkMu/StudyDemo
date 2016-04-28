//
//  PersonClass.m
//  05-单例
//
//  Created by qingyun on 16/3/26.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "PersonClass.h"

@implementation PersonClass

+(instancetype)shareClass{
#if 0
    static PersonClass *person;
    if (person==nil) {
        person=[[PersonClass alloc] init];
    }
    return person;
#endif
     static dispatch_once_t once;
     static PersonClass *person;
      dispatch_once(&once, ^{
          //只会执行一次
          person=[[PersonClass alloc] init];
      });
    return person;
}

@end
