//
//  main.m
//  block块
//
//  Created by qingyun on 16/1/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XiaoMing.h"
#import "Math.h"

int globalVar = 100;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // block 的 typedef
        typedef void (^blockType)(void);
        blockType blockObj;

        // 1. 如果返回为空，那么代码块的定义可以省去返回值类型
        // 2. 如果参数为空，代码块定义的时候参数列表可以省去
        // 3. 如果代码块的返回 值类型跟代码块的声明时类型一致，也可以省去
        
        // 这段代码声明了一个代码块对象 addBlock，并且定义了一个代码块完成赋值
        int (^addBlock)(void);
        addBlock = ^{
            BOOL r = YES;
            if (r) {
                return 10;
            } else {
                return 20;
            }
        };

        // 1 直接调用
//        void (^blockObj)(void) = ^{
//            NSLog(@"hello, everyone!");
//        };
//        blockObj();
        blockObj = ^{
            NSLog(@"hello");
            NSLog(@"今天天气不错");
            NSLog(@"出去遛狗");
        };
        blockObj();
        
        NSLog(@"result >>>> %d", addBlock());
        
        int result = addBlock();
        
        // 2 内联用法，所谓的内联就是把block当做参数传入其他的方法或者函数内部使用
        NSArray *arr = @[@123,@321,@111,@2124,@12];
        NSComparisonResult (^sortBlock)(id obj1, id obj2);
        sortBlock = ^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj2 compare:obj1];
        };
        
        NSArray *names = @[@"jike",@"mengliang",@"longxiang",@"jiawang",@"yameng",@"linghui"];
        NSLog(@"sored names >>> %@", [names sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj2 compare:obj1];
        }]);
        
        
        NSArray *sortedArr = [arr sortedArrayUsingComparator:sortBlock];
        NSLog(@"sortedArr >>>> %@", sortedArr);
        
        // 理解内联用法
        XiaoMing *xm = [XiaoMing new];
        [xm repeat:blockObj];
        
        XiaoMing *hxm = [[XiaoMing alloc] initWithName:@"黄晓明"];
        hxm.age = 20;
        XiaoMing *lxm = [[XiaoMing alloc] initWithName:@"李晓明"];
        lxm.age = 7;
        XiaoMing *zxm = [[XiaoMing alloc] initWithName:@"张晓明"];
        zxm.age = 25;
        XiaoMing *dxm = [[XiaoMing alloc] initWithName:@"大晓明"];
        dxm.age = 60;
        
        NSNumber *num1 = @10000;
        NSNumber *num2 = @20000;
        if ([num1 compare:num2] == NSOrderedAscending) {
            NSLog(@"num1 小");
        }
        
        NSArray *xms = @[hxm,lxm,zxm,dxm];
        NSLog(@"xms >>>>> %@", [xms sortedArrayUsingComparator:^NSComparisonResult(XiaoMing* obj1, XiaoMing* obj2) {
            if (obj1.age > obj2.age) {
                return NSOrderedDescending;  // 降序， 前大后小
            } else if (obj1.age == obj2.age) {
                return NSOrderedSame;
            } else {
                return NSOrderedAscending;
            }
        }]);
        
        // block 当做成员变量
        Math *mt = [[Math alloc] initWithBlock:^int(int a, int b){
            return a+b;
        }];
        NSLog(@"result >>>>>>> %d", mt.mathBlock(20,30));
        
        /*-------------------block对外部变量的使用---------------*/
        // 普通的局部变量（非对象）
        int a = 10;
        // 测试1：？？？？？变量能不能被赋值
        void (^testBlock)(void) = ^{
            NSLog(@"a >>>> %d", a);
//            a++;
            int b;
            b = a+10;
            NSLog(@"b >>>>> %d", b);
        };
        a = 100;
        testBlock();
        // 测试2：？？？？？a==????
        NSLog(@"a >>>> %d", a);
        
        // 全局变量
        // 测试1：？？？？？变量能不能被赋值
        NSLog(@"globalVar >>>> %d", globalVar);
        void (^testBlock1)(void) = ^{
            NSLog(@"globalVar >>>> %d", globalVar);
            globalVar++;
            int b;
            b = globalVar+10;
            NSLog(@"b >>>>> %d", b);
        };
        globalVar = 500;
        testBlock1();
        // 测试2：？？？？？a==????
        NSLog(@"globalVar >>>> %d", globalVar);
        
        // 静态局部变量 同全局变量
        
        // 对象
        XiaoMing *xxm = [[XiaoMing alloc] initWithName:@"xiaoming"];
        xxm.age = 10;
        void (^testBlock2)(void) = ^{
            xxm.age = 20;
//            xxm = [XiaoMing new];
        };
        testBlock2();
        NSLog(@"age >>> %d", xxm.age);
        
        // 成员变量
        Math *mt2 = [[Math alloc] init];
        mt2.firstNum = 10;
        mt2.secondNum = 100;
        mt2.otherBlock();
        NSLog(@"result >>>>>>> %d", mt2.result);
        
        // __block
        __block int c = 20;
        NSLog(@"c >>>> %d", c);
        void (^testBlock3)(void) = ^{
            NSLog(@"c >>>> %d", c);
            c++;
            int b;
            b = c+10;
            NSLog(@"b >>>>> %d", b);
        };
       // c = 500;
         NSLog(@"c >>>> %d", c);
        testBlock3();
       
        NSLog(@"c >>>> %d", c);
        
        
        
        
        
    }
    return 0;
}
