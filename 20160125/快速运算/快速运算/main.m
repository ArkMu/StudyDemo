//
//  main.m
//  快速运算
//
//  Created by qingyun on 16/1/25.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Student.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        Student *st1 = [[Student alloc] initWithDiction:@{@"name":@"linghui",
                                                         @"age":@20,
                                                         @"money":@20000,
                                                         @"birthday":[NSDate dateWithTimeIntervalSinceNow:-86400*365*20]
                                                        }];
        Student *st2 = [[Student alloc] initWithDiction:@{@"name":@"yonghui",
                                                         @"age":@21,
                                                         @"money":@20000,
                                                         @"birthday":[NSDate dateWithTimeIntervalSinceNow:-86400*365*21]
                                                         }];
        Student *st3 = [[Student alloc] initWithDiction:@{@"name":@"shangshuai",
                                                         @"age":@18,
                                                         @"money":@15000,
                                                         @"birthday":[NSDate dateWithTimeIntervalSinceNow:-86400*365*18]
                                                         }];
        NSArray *sts = @[st1,st2,st3];
        
        NSLog(@"age.avg >>>>>> %@", [sts valueForKeyPath:@"@avg.age"]); //@avg平均值
        NSLog(@"money.max >>>> %@", [sts valueForKeyPath:@"@max.money"]); //最大
        NSLog(@"birthday.min > %@", [sts valueForKeyPath:@"@min.birthday"]);//最小
        NSLog(@"money.sum >>>> %@", [sts valueForKeyPath:@"@sum.money"]);// 求和
        NSLog(@"money.count >> %@", [sts valueForKeyPath:@"@count.money"]); // 数目
        NSLog(@"moneys >>>>>>> %@", [sts valueForKeyPath:@"@distinctUnionOfObjects.money"]);// 求不重复的集合
        
        Person *p1 = [[Person alloc] initWithMoney:10000];
        Person *p2 = [[Person alloc] initWithMoney:11000];
        Person *p3 = [[Person alloc] initWithMoney:10012];
        Person *p4 = [[Person alloc] initWithMoney:210000];
        Person *p5 = [[Person alloc] initWithMoney:510000];
        Person *p6 = [[Person alloc] initWithMoney:100001];
        Person *p7 = [[Person alloc] initWithMoney:1012000];
        Person *p9 = [[Person alloc] initWithMoney:1120000];
        
        [st1.friends addObjectsFromArray:@[p1,p2]];
        [st2.friends addObjectsFromArray:@[p4,p5]];
        [st3.friends addObjectsFromArray:@[p6,p7,p9]];
        // 数组中的下级运算
        NSLog(@"sum >>>>>>> %@", [sts valueForKeyPath:@"@sum.friends.@sum.money"]);
        
    }
    return 0;
}
