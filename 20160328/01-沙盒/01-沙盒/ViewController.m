//
//  ViewController.m
//  01-沙盒
//
//  Created by qingyun on 16/3/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.获取bundle 路径
    NSString *bundlePath=[[NSBundle mainBundle] bundlePath];
    NSLog(@"=======%@",bundlePath);
    //2.沙盒根目录
    NSString *home=NSHomeDirectory();
    NSLog(@"=====%@",home);
    //3.获取documents路径
    NSString *docmentPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSLog(@"=====%@",docmentPath);
    //4.libbrary路径
    NSString *libraryPath=NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
    NSLog(@"======library==%@",libraryPath);
    //5.caches
    NSString *cachesPath=NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSLog(@"======caches+===%@",cachesPath);
    //6.Tmp
    NSString *tempPath=NSTemporaryDirectory();
    NSLog(@"=====tem====%@",tempPath);
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
