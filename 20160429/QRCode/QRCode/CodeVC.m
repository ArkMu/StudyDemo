//
//  CodeVC.m
//  QRCode
//
//  Created by qingyun on 16/4/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CodeVC.h"
#import <AVFoundation/AVFoundation.h>

@interface CodeVC ()<AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic, strong)AVCaptureDevice *device;//硬件设备
@property (nonatomic, strong)AVCaptureDeviceInput *input;//连接设备的输入管道
@property (nonatomic, strong)AVCaptureSession *session;//数据处理中心
@property (nonatomic, strong)AVCaptureMetadataOutput *output;//数据输出通道

@property (nonatomic, strong)UIImageView *inamationView;

@property (nonatomic, strong)NSTimer *timer;

@end

@implementation CodeVC

-(void)viewDidLoad{
    //设置图片
    UIImage *image = [UIImage imageNamed:@"qrcode_border"];
    //转化为可变型的图片
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(25, 25, 26, 26)];
    [self.boardImageView setImage:image];
    self.boardImageView.contentMode = UIViewContentModeScaleAspectFill;
    UIImageView *inamation = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qrcode_scanline_qrcode"]];
    self.inamationView = inamation;
    
    [self.boardImageView addSubview:self.inamationView];
    self.boardImageView.clipsToBounds = YES;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
    
    
}

-(void)changeImage{
    self.inamationView.frame = CGRectOffset(self.inamationView.frame, 0, 2);
    
    if (self.inamationView.frame.origin.y > self.boardImageView.frame.size.height) {
        self.inamationView.frame = CGRectMake(0, -self.boardImageView.frame.size.height, self.inamationView.frame.size.width, self.inamationView.frame.size.height);
    }
}

//开启二维码扫描
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    [self reading];
}

//停止二维码扫描
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self stopRead];
}

-(void)reading{
    //初始化采集的环境,开始采集
    
    //1.确定设备
    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    //2.构造intput
    NSError *error;
    self.input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:&error];
    
    
    //3.初始化outPut
    self.output = [[AVCaptureMetadataOutput alloc] init];
    
    //4.添加intput和output到session
    self.session = [[AVCaptureSession alloc] init];
    [self.session addInput:self.input];
    [self.session addOutput:self.output];
    
    //5.配置output
    dispatch_queue_t queue = dispatch_queue_create("myQueue", NULL);
    [self.output setMetadataObjectsDelegate:self queue:queue];
    [self.output setMetadataObjectTypes:self.output.availableMetadataObjectTypes];
    
    //6.设置预览效果
    AVCaptureVideoPreviewLayer *layer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.session];
    [layer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [layer setFrame:self.preView.layer.bounds];
    [self.preView.layer addSublayer:layer];
    
    [self.session startRunning];
}

-(void)stopRead{
    [self.session stopRunning];
}

-(void)result:(NSString *)result{
    [self stopRead];
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"result"];
    [vc setValue:result forKey:@"result"];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - matedate

-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if (metadataObjects.count == 0 )
        return;
    id object = metadataObjects[0];
    if ([object isKindOfClass:[AVMetadataMachineReadableCodeObject class]]) {
        AVMetadataMachineReadableCodeObject *obj = (AVMetadataMachineReadableCodeObject *)object;
        NSLog(@"%@", obj.stringValue);
        //在主线程执行
        [self performSelectorOnMainThread:@selector(result:) withObject:obj.stringValue waitUntilDone:NO];
    }
}

@end
