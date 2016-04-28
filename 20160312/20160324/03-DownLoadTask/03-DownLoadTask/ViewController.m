//
//  ViewController.m
//  03-DownLoadTask
//
//  Created by qingyun on 16/3/24.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

#define kBaseURl @"http://pic1.nipic.com/2008-12-09/200812910493588_2.jpg"
#define KdstURl @"/Users/qingyun/Desktop"


@interface ViewController ()
@end

@implementation ViewController
//下载
- (IBAction)downLoadTaskAction:(id)sender {
    //1.创建session会话
    NSURLSession *session=[NSURLSession sharedSession];
    //2.创建下载任务
    NSURLSessionDownloadTask *downTask=[session downloadTaskWithURL:[NSURL URLWithString:kBaseURl] completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //处理的结果
        if (error) {
            NSLog(@"====%@",error);
        }
  
        NSHTTPURLResponse *httpResponse=(NSHTTPURLResponse *)response;
        if (httpResponse.statusCode==200) {
            NSLog(@"=======%@",location.absoluteString);
           //将location的文件copy目的地
            NSString *savePath=[KdstURl stringByAppendingPathComponent:response.suggestedFilename];
            NSError *error;
            //文件管理类
            if ([[NSFileManager defaultManager] copyItemAtURL:location toURL:[NSURL fileURLWithPath:savePath] error:&error]) {
                NSLog(@"=====copy ok");
            }
            NSLog(@"======%@",error);
        }
    }];
    
    //3.执行任务
    [downTask resume];
    
    
    
    
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
