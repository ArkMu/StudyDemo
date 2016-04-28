//
//  ViewController.m
//  WeiBoDemo
//
//  Created by qingyun on 16/4/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "WeiboSDK.h"
#import "Common.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)login:(id)sender {
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    //设置回调地址,和平台保持一致
    request.redirectURI = kredirectURI;
    //设置请求的权限
    request.scope = @"all";
    [WeiboSDK sendRequest:request];

    
}

@end
