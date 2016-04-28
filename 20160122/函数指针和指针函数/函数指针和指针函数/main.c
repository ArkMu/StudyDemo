//
//  main.c
//  函数指针和指针函数
//
//  Created by qingyun on 16/1/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

int* foo(int,int); //函数声明，声明了 有两个整型参数 返回值是int*类型，名字是foo的这样一个函数

int a;
typedef int atype;

// 定义函数指针的类型
typedef int (*funcType)(int, int);  // ⚠️⚠️⚠️

int add(int, int);
int sub(int, int);

void math(int, int, funcType *);
void mathAdd(int, int, funcType);

funcType tellMeFunc(void);


int main(int argc, const char * argv[]) {

    int *p = foo(10, 20);
    
    printf("*p >>>> %d \n", *p);
    free(p);
    
//    int (*bar)(int,int);
//声明了一个函数指针，这个指针指向 有两个整型参数返回值是int类型的函数
    
    bar1 = &add;
    printf("bar1 >>>> %p\n", bar1);
    
    bar1 = add; //函数指针赋值， c语言中函数名字本身就是该函数栈的首地址，所以在给函数指针赋值的时候，不需要取地址
    printf("bar1 >>>> %p\n", bar1);
    
    printf("result >>>>> %d\n", bar1(50,100)); // 函数指针的调用
    
    bar2 = sub;
    
    printf("result >>>>> %d\n", bar2(150,100)); // 函数指针的调用
    
    funcType funcArr[2] = {bar1, bar2};
//    funcArr[0] = bar1;
//    funcArr[1] = bar2;
    
    math(1000, 500, funcArr);
    mathAdd(200, 700, bar2); // 函数指针当做参数来传递
    
    funcType func = tellMeFunc(); // 函数指针当做返回值来使用
    func(888,222);
    
    // 函数指针的本质：
    // 1 函数指针是变量，有自己的类型，类型就是所指向函数的 返回值和参数类型
    // 2 函数指针作为变量传递时，传递的是整个事件的实现过程，而不是运算结果
    
    return 0;
}

int* foo(int a, int b) // 指针函数，就是返回值类型是指针的函数
{
    int *intPointer = malloc(4);
    *intPointer = a+b;
    return intPointer;
}

int add(int x, int y)
{
    return x*y;
}

int sub(int m, int n)
{
    return m-n;
}

void math(int a, int b, funcType *funcArr)
{
    printf("加法：%d\n", funcArr[0](a,b));
    printf("减法：%d\n", funcArr[1](a,b));
}

void mathAdd(int a, int b, funcType func)
{
    printf("加法：%d\n", func(a,b));
}

funcType tellMeFunc(void)
{
    funcType func = add;
    return func;
}


