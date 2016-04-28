//
//  main.m
//  KVC简介
//
//  Created by qingyun on 16/1/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableDictionary *st = [NSMutableDictionary dictionaryWithDictionary:@{@"name":@"jiangqiuhua",@"age":@20,@"sex":@"nv"}];
        [st setObject:@"👩" forKey:@"sex"]; // 这个是可变字典对象的方法
        [st setValue:@"qiuhua" forKey:@"name"]; // KVC
        
        //NSKeyValueCoding 就是KVC 键值编码，使用类似字典的键值对方式来访问对象的属性
        Student *st1 = [Student new];
        [st1 setValue:@"xingze" forKey:@"name"];
        NSLog(@"st1'name >>>> %@", [st1 valueForKey:@"name"]); // KVC
        
//        for (NSString *key in st) {
//            [st1 setValue:st[key] forKey:key];
//        }
//        NSLog(@"st1'name >>>> %@", [st1 valueForKey:@"age"]);
//        
        [st1 setValuesForKeysWithDictionary:st];
        NSLog(@"st1'name >>>> %@", [st1 valueForKey:@"name"]);
        
    }
    return 0;
}
