//
//  main.m
//  深拷贝和浅拷贝
//
//  Created by qingyun on 16/1/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Man.h"
#import "Woman.h"
#import "WomanStar.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /*-------------------- 系统对象的copy -------------------*/
        NSString *name = @"魏子淇";
        
        // 对比系统常用的数据对象的 copy/mutableCopy 结果，判断他们是 深拷贝还是浅拷贝
        NSMutableString *nameCopy = [name copy]; // nameCopy = name;  浅拷贝
        NSLog(@"name >>>> %p nameCopy >>>> %p", name, nameCopy);
        
        NSMutableString *mtName = [NSMutableString stringWithString:name];
        NSMutableString *mtNameCopy = [mtName copy];
        NSLog(@"mtName >>>> %p mtNameCopy >>>> %p", mtName, mtNameCopy);
        
        NSMutableString *nameMtCopy = [name mutableCopy];
        NSLog(@"name >>>> %p mtNameCopy >>>> %p", name, nameMtCopy);
        NSMutableString *mtNameMtCopy = [mtName mutableCopy];
        NSLog(@"mtName >>>> %p mtNameCopy >>>> %p", mtName, mtNameMtCopy);
        
        // 这个结论只适用于系统的对象
        // copy 出来的对象是不可变的，mutablecopy 得到的对象是 可变的
        
        // 1
        // 不可变的对象经过 copy 之后得到结果还是不可变，是浅拷贝
        
        // 2
        // 可变的对象经过 copy 之后得到的结果也是不可变，是深拷贝
        
        // 3
        // 不可变的对象经过 mutablecopy 之后得到的结果是可变的，是深拷贝
        
        // 4 ⚠️⚠️⚠️
        // 可变的对象经过 mutablecopy 之后得到的结果也是可变的，但是是深拷贝
    
        
        /*-------------------- 自定义对象的copy -------------------*/
        Man *xiaoming = [Man new];
        xiaoming.name = @"黄晓明";
        
        Woman *baby = [Woman new];
        baby.name = @"杨颖";
        
        // 类似于这样的拷贝 只是一次性的拷贝，每次拷贝时都需要重复地写这些代码，可以通过遵循NSCopying协议，并且实现copyWithZone:来封装这样的拷贝逻辑
//        Woman *yangying = [Woman new];
//        yangying.name = baby.name;
        
        xiaoming.girlFriend = baby;
        
        // 在继承中使用拷贝
        Man *dengchao = [Man new];
        dengchao.name = @"邓超";
        
        WomanStar *sunli = [WomanStar new];
        sunli.name = @"孙俪";
        sunli.aliasName = @"娘娘";
        
        dengchao.girlFriend = sunli;
        
        NSLog(@"dc.girl >>> %p %@ sunli >>> %p %@", dengchao.girlFriend, dengchao.girlFriend.name, sunli, sunli.name);
        
        
        
    }
    return 0;
}
