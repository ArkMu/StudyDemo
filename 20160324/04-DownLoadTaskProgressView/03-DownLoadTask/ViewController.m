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


@interface ViewController ()<NSURLSessionDownloadDelegate>

@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;

@end

@implementation ViewController
//下载
- (IBAction)downLoadTaskAction:(id)sender {
   //1.创建session
    NSURLSession *session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:nil];
   //2.创建任务
    NSURLSessionDownloadTask *downTask=[session downloadTaskWithURL:[NSURL URLWithString:kBaseURl]];
   //3.执行任务
    [downTask resume];
}
#pragma mark downLoadTaskDelegate
//下载完成时调用
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
  //更新imageView
    NSData *data=[NSData dataWithContentsOfURL:location];
    UIImage *image=[UIImage imageWithData:data];
    //GCD 通过主线程刷新UI
    dispatch_async(dispatch_get_main_queue(), ^{
        _ImageView.image=image;
    });
    
    
}
//下载过程中调用 反复调用
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    //1.更新进度条
    float progress=(double)totalBytesWritten/(double)totalBytesExpectedToWrite;
    NSLog(@"====%f",progress);
    //GCD 通过主线程刷新UI
    dispatch_async(dispatch_get_main_queue(), ^{
        _progressView.progress=progress;
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
