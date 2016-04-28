//
//  ViewController.m
//  ADemo
//
//  Created by qingyun on 16/4/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)open:(id)sender {
    
    UIApplication *app = [UIApplication sharedApplication];
    //BDemo的url地址
    NSString *b = @"bDemo://?appkey=1234567890";
    [app openURL:[NSURL URLWithString:b]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
