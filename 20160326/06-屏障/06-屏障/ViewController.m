//
//  ViewController.m
//  06-屏障
//
//  Created by qingyun on 16/3/26.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)startAction:(id)sender {
   //创建队列
    //第二个参数: DISPATCH_QUEUE_CONCURRENT 表示并发队列 NUll 串行队列
    //
    dispatch_queue_t queue=dispatch_queue_create("com.qingyun.queue", DISPATCH_QUEUE_CONCURRENT);
    
    
  dispatch_async(queue, ^{
    //登陆
      [NSThread sleepForTimeInterval:2];
      NSLog(@"=====login 2s");
      
     dispatch_async(queue, ^{
         [NSThread sleepForTimeInterval:5];
         NSLog(@"=====获取部门5s ");
     });
      
     dispatch_async(queue, ^{
         [NSThread sleepForTimeInterval:4];
         NSLog(@"=====获取联系人4s ");

     });
//    //设置屏障
     dispatch_barrier_async(queue, ^{
         [NSThread sleepForTimeInterval:1];
         NSLog(@"=====pingzhan");
         
     });
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"=====2s");
    });
      
      dispatch_async(queue, ^{
          [NSThread sleepForTimeInterval:3];
          NSLog(@"=====3s");
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
