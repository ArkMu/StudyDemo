//
//  ViewController.m
//  ActivityIndicatorViewDemo
//
//  Created by qingyun on 16/2/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    //创建并t添加activityView
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.view addSubview:activityView];
    activityView.frame = CGRectMake(100, 100, 100, 100);
    //当动画停止的时候隐藏
    activityView.hidesWhenStopped = NO;
    //指示器的颜色
    activityView.color = [UIColor blueColor];
    
    [activityView startAnimating];
    
    //时隔5秒停止
    [activityView performSelector:@selector(stopAnimating) withObject:nil afterDelay:5];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
