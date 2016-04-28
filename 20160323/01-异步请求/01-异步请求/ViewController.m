//
//  ViewController.m
//  01-异步请求
//
//  Created by qingyun on 16/3/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#define downFile @"http://dlsw.baidu.com/sw-search-sp/soft/b8/25870/Wireshark1.10.6Intel64.1396001840.dmg"

#define KsavePath @"/Users/qingyun/Desktop/"


@interface ViewController ()<NSURLConnectionDataDelegate>
@property(nonatomic,strong)NSMutableData *receData;
@property(nonatomic,strong)NSString *KfilePath;
@end

@implementation ViewController

-(void)synRequest{
   //1.创建url对象
    NSURL *url=[NSURL URLWithString:downFile];
   //2.创建request对象
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
   //3.创建请求链接同步
    NSHTTPURLResponse *response;
    NSError *error;
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (error) {
        NSLog(@"=====%@",error);
    }
    
    if (response.statusCode ==200) {
      //将图片保存在本地
      //获取建议名称
        NSString *name=response.suggestedFilename;
      //合并建议名称url
       // NSString *filePath=[KsavePath stringByAppendingString:name];
        NSString *filepath=[KsavePath stringByAppendingPathComponent:name];
       //保存本地
        BOOL issave=[data writeToFile:filepath atomically:YES];
        if (issave) {
            NSLog(@"保存成功");
        }
        
    }
}
#pragma mark 异步处理
-(void)asyRequest{
  //1创建url
    NSURL *url=[NSURL URLWithString:downFile];
  //2.创建request
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
  //3.创建异步链接
    NSURLConnection *content=[[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    //开始请求
    [content start];
    
}

#pragma mark  实现协议
//开始接收响应,该法只调用一次
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    //1.判断当前的状态 200,初始化存储空间
    NSHTTPURLResponse *httpResponse=(NSHTTPURLResponse *)response;
    if (httpResponse.statusCode==200) {
        NSLog(@"===start====%@",response.suggestedFilename);
        _receData=[NSMutableData data];
        //获取建议名称
        NSString *kfileName=httpResponse.suggestedFilename;
        //合并保存路径
        _KfilePath=[KsavePath stringByAppendingPathComponent:kfileName];
    }else{
        [connection cancel];
    }

}
//接受数据 该方法会调用多次
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSLog(@"===%ld",data.length);
    //追加数据
    [_receData appendData:data];

}
//下载数据完成调用
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
  //写入到本地
    if ( [_receData writeToFile:_KfilePath atomically:YES]) {
        NSLog(@"下载完成,保存成功");
    }
    
    
    
    
}
//下载失败的时候调用
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"=======%@",error);
    [connection cancel];
}




- (IBAction)clickLoad:(id)sender {
    //同步
   // [self synRequest];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // [self synRequest];

    [self asyRequest];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
