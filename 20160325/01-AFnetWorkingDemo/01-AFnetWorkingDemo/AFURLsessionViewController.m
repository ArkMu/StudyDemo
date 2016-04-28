//
//  AFURLsessionViewController.m
//  01-AFnetWorkingDemo
//
//  Created by qingyun on 16/3/25.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "AFURLsessionViewController.h"
#import "AFNetworking/AFNetworking.h"
#define KDownURL @"http://data.5sing.kgimg.com/G063/M09/15/05/34YBAFbyk3GAIVi9ALbP_s_Yf9E300.mp3"

@interface AFURLsessionViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@end

@implementation AFURLsessionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)touchDown:(id)sender {
    //1.管理器对象
    AFURLSessionManager *manager=[[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    //2创建请求
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:KDownURL]];
    //请求序列化 http json
    NSURLRequest *request1=[[AFHTTPRequestSerializer serializer]requestWithMethod:@"GET" URLString:KDownURL parameters:nil error:nil];
    
    //3.创建下载任务
      NSURLSessionDownloadTask *task=[manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress){
          //下载进度
           dispatch_async(dispatch_get_main_queue(), ^{
              //主线程更新ui
               _progressView.progress=downloadProgress.fractionCompleted;
           });
      } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
          //存储文件的路径
          NSString *savePath=[@"/Users/qingyun/Desktop" stringByAppendingPathComponent:response.suggestedFilename];
          return[NSURL fileURLWithPath:savePath];
          
      }completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
         //文件下载完成后的操作
          NSLog(@"========%@",filePath.absoluteString);
      }];
    
    //4.执行任务
    [task resume];
    

}
- (IBAction)touchUPload:(id)sender {
   //1.创建sessionManger
    AFURLSessionManager *manger=[[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    //2.创建request
    NSMutableURLRequest *request=[[AFHTTPRequestSerializer serializer]multipartFormRequestWithMethod:@"Post" URLString:@"http://afnetworking.sinaapp.com/upload2server.json" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        /**
         *  封装请求的body参数
         */
        [formData appendPartWithFileData:UIImagePNGRepresentation([UIImage imageNamed:@"1"]) name:@"image" fileName:@"222.png" mimeType:@"image/png"];
        [formData appendPartWithFileURL:[[NSBundle mainBundle] URLForResource:@"2" withExtension:@"jpg"] name:@"image" fileName:@"333.jpg" mimeType:@"image/jpeg" error:nil];
    } error:nil];
    
    //3.创建上传任务
    NSURLSessionUploadTask *task=[manger uploadTaskWithStreamedRequest:request progress:^(NSProgress * _Nonnull uploadProgress) {
        //更新进度条
        dispatch_async(dispatch_get_main_queue(), ^{
            _progressView.progress=uploadProgress.fractionCompleted;
            
        });

    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if(error)NSLog(@"====%@",error);
        
        NSLog(@"=======%@",responseObject);
        
    }];
    
    //4.启动任务
    [task resume];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
