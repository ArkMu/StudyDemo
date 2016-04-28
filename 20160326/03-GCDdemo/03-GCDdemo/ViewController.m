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
        
       dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
            [self getcontact];//3
           dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                 [self sesionList];//2
               NSDate *nowDate=[NSDate date];
               NSTimeInterval time1=[nowDate timeIntervalSinceDate:data];
              // NSLog(@"====%f",time1);
           });
           
       });
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
               [self configInfo];//4
            NSDate *nowDate=[NSDate date];
            NSTimeInterval time1=[nowDate timeIntervalSinceDate:data];
            NSLog(@"====%f",time1);
        });
        //更新ui 调用主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"======更新UI完成");
           
            
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
