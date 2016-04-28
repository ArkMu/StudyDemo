//
//  ViewController.m
//  01-NsurlContection-同步
//
//  Created by qingyun on 16/3/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#define KbaseUrl @"http:www.hnqingyun.com"


@interface ViewController ()

@end

@implementation ViewController

#pragma mark 同步请求

-(void)request{
    //1请求的地址
    NSURL *url=[NSURL URLWithString:KbaseUrl];
    //2设置请求
    NSURLRequest *request=[NSURLRequest requestWithURL:url];

    //3.发送请求
    /*  request 封装请求的对象
     *  returningResponse:响应的对象用来封装响应的相关信息
     *
     */

    NSHTTPURLResponse *response;
    
    NSError *error;
    NSData *recevieData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];

    //判断状态码
    if(response.statusCode==200){
        NSLog(@"=====%@",response.MIMEType);
        
        //1.取出数据
        NSString *str=[[NSString alloc] initWithData:recevieData encoding:NSUTF8StringEncoding];
        NSLog(@"======%@",str);
    }
    
    NSLog(@"=====%@",error);

}




- (void)viewDidLoad {
    [super viewDidLoad];
    [self request];
    }


@end
