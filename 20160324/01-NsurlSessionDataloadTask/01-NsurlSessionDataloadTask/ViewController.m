//
//  ViewController.m
//  01-NsurlSessionDataloadTask
//
//  Created by qingyun on 16/3/24.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#define Kurl @"http://dlzxx.nhedu.net/computer2/upload/2012-11/12110811076093.jpg"



@interface ViewController ()

@end
@implementation ViewController


- (IBAction)requestLoadTask:(UIButton *)sender {
  //1.创建session 会话
    NSURLSession *seesion=[NSURLSession sharedSession];
  //2创建任务 loaddata
    NSURLSessionDataTask *dataTask=[seesion dataTaskWithURL:[NSURL URLWithString:Kurl] completionHandler:^(NSData *  data, NSURLResponse * response, NSError *  error) {
     //处理返回的结果
        if (error) {
            NSLog(@"====%@",error);
        }
        //1强转 NSHTTPURLResponse
        NSHTTPURLResponse *httpResponsed=(NSHTTPURLResponse *)response;
        NSLog(@"======%lld",httpResponsed.expectedContentLength);
        
        if (httpResponsed.statusCode==200) {
            NSString *str=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"===str====%@",str);
        }
        
        //跟新ui
        
    }];
   //3.启动任务
    [dataTask resume];

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
