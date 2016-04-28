//
//  ViewController.m
//  02-Post请求
//
//  Created by qingyun on 16/3/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#define Kurl @"http://afnetworking.sinaapp.com/persons.json"

@interface ViewController ()
@end
@implementation ViewController



- (IBAction)PostAction:(id)sender {
  //1.创建url
    NSURL *url=[NSURL URLWithString:Kurl];
    
  //2.创建request
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    //设置请求方法
    request.HTTPMethod=@"post";
    //设置参数
    NSString *pramterStr=@"person_type=student";
    //设置body
    request.HTTPBody=[pramterStr dataUsingEncoding:NSUTF8StringEncoding];
    
   //3.创建链接
    NSHTTPURLResponse *response;
    NSError *error;
    NSData *receData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
  
    if (error) {
        NSLog(@"=======%@",error);
    }
    
    if (response.statusCode==200) {
    //data====>string
        NSString *str=[[NSString alloc] initWithData:receData encoding:NSUTF8StringEncoding];
        NSLog(@"========%@",str);
    }
    
    
    
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
