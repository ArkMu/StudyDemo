//
//  ViewController.m
//  03-Touch练习
//
//  Created by qingyun on 16/3/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *cyanImageView;
@property (weak, nonatomic) IBOutlet UIImageView *magentImageView;
@property (weak, nonatomic) IBOutlet UIImageView *yellowImageView;


@end

#define kwidth  [UIScreen mainScreen].bounds.size.width
#define KHeight [UIScreen mainScreen].bounds.size.height

@implementation ViewController

- (void)viewDidLoad {
    self.view.multipleTouchEnabled=YES;
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//判断点是否在任意一个视图上
-(BOOL)isImageViewContainsPoint:(CGPoint)point{
    if(CGRectContainsPoint(_cyanImageView.frame, point)||CGRectContainsPoint(_magentImageView.frame, point)||CGRectContainsPoint(_yellowImageView.frame, point)){
        return YES;
    }
    return NO;
}

-(void)resetFrame{
  //还原操作
    [UIView animateWithDuration:.5 animations:^{
        _cyanImageView.center=CGPointMake(kwidth/3.0,KHeight/3.0);
        _magentImageView.center=CGPointMake(kwidth/3.0*2,KHeight/3.0*2);
        _yellowImageView.center=CGPointMake(kwidth/3.0*3,KHeight/3.0*3);
        
    }];
    
    
    

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //获取当前的点
   UITouch *touch=[touches anyObject];
   CGPoint point=[touch locationInView:self.view];
    //判断当前点是否在三个imageView上
    if ([self isImageViewContainsPoint:point]) {
        //1.取到当前视图
        UIImageView *imageView=(UIImageView *)touch.view;
        //2.放大视图
        [UIView animateWithDuration:.5 animations:^{
            imageView.transform=CGAffineTransformMakeScale(1.2, 1.2);
            imageView.center=point;
        }];
    }else{
      //执行还原操作
        if(touch.tapCount==2){
            [self resetFrame];
        }
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //1.获取当前的touch
    UITouch *touch=[touches anyObject];
    //2获取当前点
    CGPoint point=[touch locationInView:self.view];
    //3.判断当前点是否在当前的三个视图任意视图
    if(CGRectContainsPoint(_cyanImageView.frame, point)){
    //中心点设置为point
        [UIView animateWithDuration:.3 animations:^{
            _cyanImageView.center=point;
        }];
    }
    
    if (CGRectContainsPoint(_magentImageView.frame, point)) {
        [UIView animateWithDuration:.3 animations:^{
            _magentImageView.center=point;
        }];
    }
    
    if (CGRectContainsPoint(_yellowImageView.frame, point)) {
        [UIView animateWithDuration:.3 animations:^{
         _yellowImageView.center=point;
        }];
        
    }
    
//    NSLog(@"%ld", self.view.subviews.count);
    for (UIView *view in self.view.subviews) {
        NSLog(@"%@", [view class]);
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //复原操作
    //1获取当前触摸的视图
    UITouch *touch=[touches anyObject];
    UIImageView *imageView=(UIImageView *)touch.view;
    [UIView  animateWithDuration:.5 animations:^{
        imageView.transform=CGAffineTransformIdentity;
    }];
    
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
