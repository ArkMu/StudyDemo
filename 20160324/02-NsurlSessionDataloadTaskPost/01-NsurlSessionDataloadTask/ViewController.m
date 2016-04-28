//
//  ViewController.m
//  01-NsurlSessionDataloadTask
//
//  Created by qingyun on 16/3/24.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#define Kurl @"http://afnetworking.sinaapp.com/persons.json"



@interface ViewController ()

@end
@implementation ViewController


- (IBAction)requestLoadTask:(UIButton *)sender {
  //1.创建session 会话
    NSURLSession *seesion=[NSURLSession sharedSession];
  //2创建任务 loaddata
      //2.1创建request
        NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:Kurl]];
       //2.1.1设置请求方法
       request.HTTPMethod=@"POST";
       //2.1.2设置参数
       NSString *pramaterStr=@"person_type=student";
       request.HTTPBody=[pramaterStr dataUsingEncoding:NSUTF8StringEncoding];

    NSURLSessionDataTask *dataTask=[seesion dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
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
