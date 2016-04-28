//
//  main.m
//  谓词
//
//  Created by qingyun on 16/1/25.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray *engineers = @[
                               @{
                                   @"name":@"alinghui",
                                   @"age":@22,
                                   @"salary":@{
                                           @"lastmonth":@50000,
                                           @"thismonth":@15000
                                           }
                                   },
                               @{
                                   @"name":@"bYONGhui",
                                   @"age":@25,
                                   @"salary":@{
                                           @"lastmonth":@20000,
                                           @"thismonth":@11000
                                           }
                                   },
                               @{
                                   @"name":@"shÄng",
                                   @"age":@20,
                                   @"salary":@{
                                           @"lastmonth":@110000,
                                           @"thismonth":@8000
                                           }
                                   },
                               ];
        NSArray *salary = @[@1000,@2000,@800,@1500];
        
        // 1 SELF 表示集合对象本身，建议全大写
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF < 1200"];
        NSLog(@"subsalary >>>> %@", [salary filteredArrayUsingPredicate:pred]);
        
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"age >= 25"];
        NSLog(@"age >= 25 >>>> %@", [engineers filteredArrayUsingPredicate:pred1]);
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"salary.lastmonth >= 100000"];
        NSLog(@"salary.lastmonth >= 100000 >>>> %@", [engineers filteredArrayUsingPredicate:pred3]);
        
        // 2 关系表达式 > < >= <= != ==
        // 3 逻辑表达式 AND(&&) OR(||)
        NSPredicate *pred4 = [NSPredicate predicateWithFormat:@"age > 20 AND (salary.thismonth > 8000 AND salary.lastmonth >= 20000)"];
        NSLog(@"result >>>> %@", [engineers filteredArrayUsingPredicate:pred4]);
        
        // 4 ALL ANY
//        NSPredicate *pred5 = [NSPredicate predicateWithFormat:@"ALL age > 18 AND salary.thismonth >= 8000"];
//        if ([pred5 evaluateWithObject:engineers]) {
//            NSLog(@"所有人都大于18岁");
//        } else {
//            NSLog(@"有童工，举报");
//        }
        
        NSPredicate *pred6 = [NSPredicate predicateWithFormat:@"ANY age > 18"];
        if ([pred6 evaluateWithObject:engineers]) {
            NSLog(@"有人都大于18岁");
        } else {
            NSLog(@"所有人都是童工，举报");
        }
        
        // 5 范围查找 IN BETWEEN
        NSPredicate *pred7 = [NSPredicate predicateWithFormat:@"salary.thismonth IN {15000,8000,20000, 89898}"]; // 指定条件
        NSLog(@"result >>>> %@", [engineers filteredArrayUsingPredicate:pred7]);
        NSPredicate *pred8 = [NSPredicate predicateWithFormat:@"salary.thismonth BETWEEN {8000,15000}"];  // 起始条件
        NSLog(@"result >>>> %@", [engineers filteredArrayUsingPredicate:pred8]);
        
        // 6 字符串与谓词 可以加筛                                                                                                                                选的选项 [c(不区分大小写)d(不区分重音符号)]
        // CONTAINS
        NSPredicate *pred9 = [NSPredicate predicateWithFormat:@"name CONTAINS 'hui'"];
        NSLog(@"result >>>> %@", [engineers filteredArrayUsingPredicate:pred9]);
        // BEGINSWITH
        NSPredicate *pred10 = [NSPredicate predicateWithFormat:@"name BEGINSWITH 'sh'"];
        NSLog(@"result >>>> %@", [engineers filteredArrayUsingPredicate:pred10]);
        // ENDSWITH
        // LIKE 通配符 ？表示任意一个字符 * 表示任意多个字符
        NSPredicate *pred11 = [NSPredicate predicateWithFormat:@"name LIKE[c]  '??ng*'"];
        NSLog(@"result >>>> %@", [engineers filteredArrayUsingPredicate:pred11]);
        
        NSPredicate *pred12 = [NSPredicate predicateWithFormat:@"name CONTAINS[cd] 'a'"];
        NSLog(@"result >>>> %@", [engineers filteredArrayUsingPredicate:pred12]);
        
        // 7 谓词模板
        // 7.1 格式化 %K用来格式化键名
        NSString *filterKey = @"salary.thismonth";
        int fileterValue = 10000;
        NSPredicate *pred13 = [NSPredicate predicateWithFormat:@"%K > %d", filterKey, fileterValue];
        NSLog(@"result >>>> %@", [engineers filteredArrayUsingPredicate:pred13]);
        
        // 7.3 模板 使用谓词模板时，必须保证模板中的 占位符名字 跟替换字典中的键名保持一致
        NSPredicate *predTheme = [NSPredicate predicateWithFormat:@"name BEGINSWITH $name AND age > $age AND salary.thismonth > $thismonth AND salary.lastmonth > $lastmonth"];
        NSDictionary *dict = @{@"name":@"a", @"age":@15, @"thismonth":@10000, @"lastmonth":@20000};
        NSPredicate *pred14 = [predTheme predicateWithSubstitutionVariables:dict];
        NSLog(@"result >>>> %@", [engineers filteredArrayUsingPredicate:pred14]);
        
        
        // 8.谓词与正则表达式
        NSString *regular1 = @"[\\D]";
        
        NSString *eamilTest = @"[A-Z0-9a-z]+@[A-Z0-9a-z]+\\.[A-Za-z]{2,4}";
                            //   afwfwa123fwefw@waefw1321fwfwafwff.cn
        NSString *em1 = @"zh1231qinpei1241241agawefgawefwaefaweef@163.com";
        NSString *em2 = @"test_@1763.com";
        NSString *em3 = @"test@test.com";
        NSString *em4 = @"testtesttes";
        // match 使用正则匹配内容
        NSPredicate *pred15 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", eamilTest];
        
        if ([pred15 evaluateWithObject:em1]) {
            NSLog( @"YES");
        }
        if ([pred15 evaluateWithObject:em2]) {
            NSLog(@"YES");
        }
        if ([pred15 evaluateWithObject:em3]) {
            NSLog(@"YES");
        }
        if ([pred15 evaluateWithObject:em4]) {
            NSLog(@"YES");
        }
        
        NSString *content = @"1.写一个NSArray类别，zhqinpei@163.com使用block实test@163.com现排序。";
        NSRange range = [content rangeOfString:eamilTest options:NSRegularExpressionSearch];
        NSLog(@"range >>> %@", NSStringFromRange(range));
        NSRange range1 = [content rangeOfString:eamilTest options:NSRegularExpressionSearch range:NSMakeRange(NSMaxRange(range), content.length - NSMaxRange(range))];
        NSLog(@"range1 >>> %@", NSStringFromRange(range1));
        
        
    }
    return 0;
}
