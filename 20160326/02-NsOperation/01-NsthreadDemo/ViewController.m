//
//  ViewController.m
//  01-NsthreadDemo
//
//  Created by qingyun on 16/3/26.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ImageVIEW;

@end

@implementation ViewController


-(void)upUIImageView:(UIImage *)image{
  //主线程
    self.ImageVIEW.image=image;
}


-(void)downLoadImage:(NSString *)url{
    
    if([NSThread isMainThread]) NSLog(@"======main");
   //1.图片下载
    NSData *data=[NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage *image=[UIImage imageWithData:data];
   //更新ui
    if([NSThread isMainThread]){
    _ImageVIEW.image=image;
    }else{
     [self performSelectorOnMainThread:@selector(upUIImageView:) withObject:image waitUntilDone:YES];
    //主线程更新UI
//     dispatch_async(dispatch_get_main_queue(), ^{
//      _ImageVIEW.image=image;
//     });
    }
}

- (IBAction)touchDown:(id)sender {
    //创建子任务
   // NSInvocationOperation *operation=[[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downLoadImage:) object:@"http://pic41.nipic.com/20140509/18285693_231156450339_2.jpg"];
    
    NSBlockOperation *operation=[NSBlockOperation blockOperationWithBlock:^{
        //处理任务 启动一条线程
        [self downLoadImage:@"http://pic41.nipic.com/20140509/18285693_231156450339_2.jpg"];
    }];
    
    //2.创建队列
    NSOperationQueue *queue=[[NSOperationQueue alloc] init];
   
    
    
    //3.将任务添加到队列 ,启动一条线程
    [queue addOperation:operation];
    
       
//    if([NSThread isMainThread]) NSLog(@"======main");
//    //[self downLoadImage:@"http://pic41.nipic.com/20140509/18285693_231156450339_2.jpg"];
//    //启动一条子线程 加载图片
//    [NSThread detachNewThreadSelector:@selector(downLoadImage:) toTarget:self withObject:@"http://pic41.nipic.com/20140509/18285693_231156450339_2.jpg"];
//    
    
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
