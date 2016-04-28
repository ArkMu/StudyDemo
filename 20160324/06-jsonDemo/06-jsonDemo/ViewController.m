//
//  ViewController.m
//  06-jsonDemo
//
//  Created by qingyun on 16/3/24.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#define KbaseUrl @"http://www.weather.com.cn/data/cityinfo/101010100.html"
@interface ViewController ()

@end

@implementation ViewController



-(void)request{
    NSURLSession *session=[NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask=[session dataTaskWithURL:[NSURL URLWithString:KbaseUrl] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       //处理json数据 解析json
        id objc=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        if ([objc isKindOfClass:[NSDictionary class]]) {
            NSLog(@"===字典====%@",objc);
        }else if([objc isKindOfClass:[NSArray class]]){
            NSLog(@"===数组====%@",objc);
        }
        
        // 字典转模型
        
        //更新ui
        
        
    }];

    [dataTask resume];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self request];
    //封装json
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    [dic setValue:@"zhangsan" forKey:@"username"];
    [dic setValue:@"12356" forKey:@"pwd"];
    [dic setValue:@"student" forKey:@"person_type"];
     NSArray *arr=@[@"454565665",@"4455666@163.com",@"13245677899"];
    [dic setValue:arr forKey:@"lx"];
   //字典封装===Json数据
    NSData *jsonData=[NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    
    NSLog(@"========%@",[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    
  NSString *JSONSTR=@"{\"username\":\"zhangsan\",\"lx\":[\"454565665\",\"4455666@163.com\",\"13245677899\"],\"person_type\":\"student\",\"pwd\":\"12356\"}";

  NSData *data=[JSONSTR dataUsingEncoding:NSUTF8StringEncoding];
    
  NSDictionary *value=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    
    NSLog(@"====%@",value);
    
    if ([NSJSONSerialization  isValidJSONObject:dic]) {
        NSLog(@"shi");
    }
    
    
    

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
