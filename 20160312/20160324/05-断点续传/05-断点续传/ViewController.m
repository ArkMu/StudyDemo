//
//  ViewController.m
//  05-断点续传
//
//  Created by qingyun on 16/3/24.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#define  KBaseURl @"http://dlzxx.nhedu.net/computer2/upload/2012-11/12110811076093.jpg"

@interface ViewController ()<NSURLSessionDownloadDelegate>


@property (weak, nonatomic) IBOutlet UIButton *suspedBtn;
@property (weak, nonatomic) IBOutlet UIButton *resumeBtn;
@property (weak, nonatomic) IBOutlet UIProgressView *progerssView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong,nonatomic) NSData *resumeData;
@property (strong,nonatomic) NSURLSessionDownloadTask *downTask;
@property (strong,nonatomic)  NSURLSession *session;

@end

@implementation ViewController

#pragma mark 暂停
- (IBAction)cancel:(UIButton *)sender {
    //1.调用取消,同时把resumedata 存储起来,以为下次点击继续下载,生成新的downloadTask
    if(_resumeData){
        _suspedBtn.hidden = YES;
        return;
    }
    [_downTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
       //赋值给resumeData
        _resumeData=resumeData;
    }];
    sender.hidden=YES;
    _resumeBtn.hidden=NO;
    _downTask=nil;
}

#pragma mark 继续
- (IBAction)resume:(UIButton *)sender {
    //判断_downTask 是不是已经取消
    if (_downTask) {
      
        return;
        
    }
   //2用ResumeData重新生成下载任务
    _downTask=[_session downloadTaskWithResumeData:_resumeData];
   //3.启动任务
    [_downTask resume];
    
    _resumeData=nil;
    sender.hidden=YES;
    _suspedBtn.hidden=NO;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.创建session会话
    _session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self  delegateQueue:nil];
    //2.创建任务
   _downTask=[_session downloadTaskWithURL:[NSURL URLWithString:KBaseURl]];
    
    //3.开始任务
    [_downTask resume];
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark downLoadDelegate
//更新进度条,获取下载的进度
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    //1.获取当前下载进度比例
    float progress=(double)totalBytesWritten/(double)totalBytesExpectedToWrite;
    //更新进度条
    dispatch_async(dispatch_get_main_queue(), ^{
        _progerssView.progress=progress;
        NSLog(@"%f",progress);
    });
   
    

}
//完成下载,更新ui
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
   //1.获取当前下载资源的Nsdata
    NSData *data=[NSData dataWithContentsOfURL:location];
    //data=======>>>image;
    UIImage *image=[UIImage imageWithData:data];
    
  //2.更新ImageView
    dispatch_async(dispatch_get_main_queue(), ^{
        _imageView.image=image;

    });

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
