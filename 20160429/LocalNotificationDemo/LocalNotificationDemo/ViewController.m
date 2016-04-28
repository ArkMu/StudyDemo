//
//  ViewController.m
//  LocalNotificationDemo
//
//  Created by qingyun on 16/4/27.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

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
- (IBAction)noti:(id)sender {
    //向系统注册一个本地通知
    UILocalNotification *local = [[UILocalNotification alloc] init];
    //触发时间
    local.fireDate = [[NSDate date] dateByAddingTimeInterval:5];
    local.alertBody = @"吃饭了....";
    local.alertAction = @"吃饭去";
    //设置循环条件
    local.repeatCalendar = [NSCalendar currentCalendar];
    local.repeatInterval = NSCalendarUnitMinute;//每分钟循环一次
    
    
    //应用icon上的标记
    local.applicationIconBadgeNumber = 3;
    
    //添加userInfo
    local.userInfo = @{@"action":@"吃饭"};
    
    //向系统注册
    [[UIApplication sharedApplication] scheduleLocalNotification:local];
}
- (IBAction)sleep:(id)sender {
    UILocalNotification *local = [[UILocalNotification alloc] init];
    //触发时间
    local.fireDate = [[NSDate date]dateByAddingTimeInterval:7];
    local.alertBody = @"该睡觉了 ....";
    //添加userInfo
    local.userInfo = @{@"action":@"睡觉"};
    //向系统注册
    [[UIApplication sharedApplication]scheduleLocalNotification:local];
}

@end
