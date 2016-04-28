//
//  ViewController.m
//  05-单例
//
//  Created by qingyun on 16/3/26.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "PersonClass.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    
   
   dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       PersonClass *person1=[PersonClass shareClass];
       NSLog(@"========%@",person1);
       
   });
    
   dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        PersonClass *person2=[PersonClass shareClass];
        NSLog(@"========%@",person2);
        
    });  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        PersonClass *person3=[PersonClass shareClass];
        NSLog(@"========%@",person3);
        
    });  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        PersonClass *person4=[PersonClass shareClass];
        NSLog(@"========%@",person4);
        
    });  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        PersonClass *person5=[PersonClass shareClass];
        NSLog(@"========%@",person5);
        
    });
    
    
    
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
