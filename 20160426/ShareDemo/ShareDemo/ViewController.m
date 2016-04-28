//
//  ViewController.m
//  ShareDemo
//
//  Created by qingyun on 16/4/26.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>

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
- (IBAction)share:(id)sender {
    //要分享的图片放到数组中
    NSArray *images = @[[UIImage imageNamed:@"share"]];
    //准备一个可变字典,存放参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //初始化参数的内容
    [params SSDKSetupShareParamsByText:@"青云欢迎你!" images:images url:[NSURL URLWithString:@"Http://www.hnqingyun.com"] title:@"分享" type:SSDKContentTypeAuto];
    
    [ShareSDK showShareActionSheet:nil items:nil shareParams:params onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
        if (state == SSDKResponseStateSuccess) {
            NSLog(@"分享成功");
        }
        if (state == SSDKResponseStateFail) {
            NSLog(@"分享失败");
        }
        if (state == SSDKResponseStateCancel) {
            NSLog(@"分享取消");
        }
    }];
    
}

@end
