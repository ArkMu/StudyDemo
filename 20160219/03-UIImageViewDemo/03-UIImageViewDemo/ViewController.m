//
//  ViewController.m
//  03-UIImageViewDemo
//
//  Created by qingyun on 16/2/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//更改imageView的高亮状态
-(void)changeImageViewState:(NSTimer *)timer{
    UIImageView *imageView = timer.userInfo;
    imageView.highlighted = !imageView.highlighted;
}

-(void)btnClick:(UIButton *)btn{
    NSLog(@"%s",__func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
#if 0
    //创建并添加imageView
    UIImage *image = [UIImage imageNamed:@"dog1"];
    UIImage *hImage = [UIImage imageNamed:@"dog2"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image highlightedImage:hImage];
    [self.view addSubview:imageView];
    //设置frame
    imageView.frame = CGRectMake(100, 100, 100, 100);
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeImageViewState:) userInfo:imageView repeats:YES];
    
    //可以与用户交互
    imageView.userInteractionEnabled = YES;
    
    //在imageView上添加btn
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [imageView addSubview:btn];
    //frame
    btn.frame = CGRectMake(0, 0, 100, 100);
    //title
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    //添加监听
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
#else
    
    //创建一个火焰的imageView
    UIImageView *fireView = [[UIImageView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:fireView];
    //创建一个可变数组，来存储火焰图片
    NSMutableArray *fireArray = [NSMutableArray array];
    for (int i = 01; i < 18; i++) {
        NSString *imageName = [NSString stringWithFormat:@"campFire%02d.gif",i];
        UIImage *image = [UIImage imageNamed:imageName];
        [fireArray addObject:image];
    }
    
    //设置fireView的帧动画数组
    fireView.animationImages = fireArray;
    //设置动画时间
    fireView.animationDuration = 1.75;
    //设置动画的重复次数
    fireView.animationRepeatCount = 0;
    //开始帧动画
    [fireView startAnimating];
#endif
    
    //使用定时器来创建雪花
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(flySnow) userInfo:nil repeats:YES];
}

-(void)flySnow{
    //创建雪花并添加
    UIImageView *snow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"flake"]];
    [self.view addSubview:snow];
    //获取屏幕的宽度
    int QYScreenW = [UIScreen mainScreen].bounds.size.width;
    //雪花的起始位置X
    int x1 = arc4random() % QYScreenW;
    //雪花的大小的倍数
    double scale = 1.0 + 1.0 / (arc4random() % 100 + 1);
    snow.frame = CGRectMake(x1, -60, 30 * scale, 30 * scale);
    //雪花飘落
    [UIView animateWithDuration:5 * scale animations:^{
        //雪花最终的位置X
        int x2 = arc4random() % QYScreenW;
        //设置雪花最终的位置
        snow.frame = CGRectMake(x2, CGRectGetMaxY(self.view.frame) - 20 * scale, 20 * scale, 20 * scale);
    } completion:^(BOOL finished) {
        //动画结束之后移除雪花
        [snow removeFromSuperview];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
