//
//  AFhttpSessionViewController.m
//  01-AFnetWorkingDemo
//
//  Created by qingyun on 16/3/25.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "AFhttpSessionViewController.h"
#import "AFNetworking/AFNetworking.h"


@interface AFhttpSessionViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *progerss;
@property (nonatomic,strong)AFHTTPSessionManager *manager;

@end

@implementation AFhttpSessionViewController

-(AFHTTPSessionManager *)manager{
    if (_manager) {
        return _manager;
    }
    _manager=[AFHTTPSessionManager manager];
    //设置网络监控
    _manager.reachabilityManager=[AFNetworkReachabilityManager sharedManager];
    
    [_manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"=====%@",AFStringFromNetworkReachabilityStatus(status));
    }];
    //启动监控
    [_manager.reachabilityManager startMonitoring];

    return _manager;
}



- (IBAction)GetAction:(id)sender {
   //1.设置参数
    NSDictionary *pramaters=@{@"foo":@"bar"};
   //2.get请求
    [self.manager GET:@"http://afnetworking.sinaapp.com/request_get.json" parameters:pramaters progress:^(NSProgress * _Nonnull downloadProgress) {
        //可以监听你的下载进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"=====%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"====%@",error);
    }];
    
    
}

- (IBAction)mutPostAction:(id)sender {
   
  [self.manager POST:@"http://afnetworking.sinaapp.com/upload2server.json" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
      //追加上传文件
      [formData appendPartWithFileURL:[[NSBundle mainBundle]URLForResource:@"1" withExtension:@"png"] name:@"image" fileName:@"zhangsan.png" mimeType:@"image/png" error:nil];
      [formData appendPartWithFileURL:[[NSBundle mainBundle] URLForResource:@"2" withExtension:@"jpg"] name:@"image" fileName:@"lisi.jpg" mimeType:@"image/jpeg" error:nil];
      
      
  } progress:^(NSProgress * _Nonnull uploadProgress) {
      //上传进度
      dispatch_async(dispatch_get_main_queue(), ^{
       //更新进度条
          _progerss.progress=uploadProgress.fractionCompleted;
      });
  } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
      //执行上传成功
      NSLog(@"====%@",responseObject);
  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
      NSLog(@"=====%@",error);
      
  }];
    
    
    
}

- (IBAction)postAction:(id)sender {
    //1.设置参数
    NSDictionary *pramater=@{@"foo":@"bar"};
    //设置请求序列化 json
    self.manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //2.响应序列化
    self.manager.responseSerializer=[AFJSONResponseSerializer serializer];
    
    
    [self.manager POST:@"http://afnetworking.sinaapp.com/request_post_body_json.json" parameters:pramater progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"=======%@",responseObject);
        NSLog(@"%@", task.currentRequest);
      NSHTTPURLResponse *responsed  =(NSHTTPURLResponse *)task.response;
        NSLog(@"====%@",responsed.allHeaderFields);
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"error====%@",error);
    }];
    
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
