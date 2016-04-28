//
//  ViewController.m
//  01-FinalDemo
//
//  Created by qingyun on 16/3/26.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController
- (IBAction)touchUpDown:(id)sender {
    //1.创建一个串行队列
    dispatch_queue_t queue=dispatch_queue_create("com.qingyun.hn",NULL);
    dispatch_async(queue, ^{
        NSLog(@"=======1job");
        dispatch_async(queue, ^{
           NSLog(@"======2");
            //死锁
        });
    });
    
    
    
    dispatch_async(queue, ^{
        NSLog(@"333");
    });
    dispatch_async(queue,^{
        NSLog(@"4");
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
