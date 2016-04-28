//
//  ViewController.m
//  03-GCDdemo
//
//  Created by qingyun on 16/3/26.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(void)logIn{
    [NSThread sleepForTimeInterval:2];
    NSLog(@"======denglu");
}
-(void)getcontact{
    [NSThread sleepForTimeInterval:3];
    NSLog(@"=======获取联系人");
}
-(void)sesionList{
    [NSThread sleepForTimeInterval:2];
    NSLog(@"=======会话列表");
}
-(void)configInfo{
    [NSThread sleepForTimeInterval:4];
    NSLog(@"=======config inof");
}

- (IBAction)clickDown:(id)sender {
    //1.开始下载数据
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSDate *data=[NSDate date];
        //任务
        //1登陆操作
        [self logIn];//2s
      //2.创建组
        dispatch_group_t group=dispatch_group_create();
    //把操作全部放组里
         dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [self getcontact];//3s
    
         });
        //会话列表
         dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
             [self sesionList];//2s;
         });
        //配置信息
         dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
             [self configInfo];//4s;
         });
        
      //汇总组里已经完成下载,通知更新操作
        dispatch_group_notify(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSLog(@"更新UI");
           dispatch_sync(dispatch_get_main_queue(), ^{
               NSLog(@"======更新完成");
               
               NSDate *nowDate=[NSDate date];
               NSTimeInterval time1=[nowDate timeIntervalSinceDate:data];
            NSLog(@"====%f",time1);
           });
        });
        
        
    });
    
    
    
    
    
    
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
