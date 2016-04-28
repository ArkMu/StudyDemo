//
//  ViewController.m
//  01-手势识别器
//
//  Created by qingyun on 16/3/18.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//
//点击手势 (UITapGestureRecognizer)
//滑动手势 (UISwipeGestureRecognizer)
//旋转手势 (UIRotationGestureRecognizer)
//捏合手势 (UIPinchGestureRecognizer)
//长按手势 (UILongPressGestureRecognizer)
//平移手势 (UIPanGestureRecognizer)
//屏幕边缘平移手势 (UIScreenEdgePanGestureRecognizer)


-(void)singleTap:(UITapGestureRecognizer *)recognizer{
    NSLog(@"======单击了");
}

-(void)doubleTapAction:(UITapGestureRecognizer *)recognizer{
    NSLog(@"======双击了");
}

-(void)swipeGestureAction:(UISwipeGestureRecognizer *)recognzier{
    NSLog(@"扫动了");

}
-(void)rotationGesture:(UIRotationGestureRecognizer *)recognzier{
    NSLog(@"旋转了");
}

-(void)pinchAction:(UIPinchGestureRecognizer *)recognzier{
    NSLog(@"捏合了");
}

-(void)longPressAction:(UILongPressGestureRecognizer *)gestureRecognizer{
    
    if  (gestureRecognizer.state==UIGestureRecognizerStateBegan){
       NSLog(@"长按了");
    }
}

-(void)panAction:(UIPanGestureRecognizer *)recognizer{
    NSLog(@"======平移了");
}

-(void)edgeGestureAction:(UIScreenEdgePanGestureRecognizer *)recognizer{
    NSLog(@"======屏幕边缘动了");
}

- (void)viewDidLoad {
    //多个手指点击一定要打开多点触摸
    self.view.multipleTouchEnabled=YES;
    [super viewDidLoad];
   //1.单击手势
    UITapGestureRecognizer *singleTap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    //设置手指数量
    //singleTap.numberOfTouchesRequired=2;
    [self.view addGestureRecognizer:singleTap];
    
    //2双击事件
    UITapGestureRecognizer *doubleTap=[[UITapGestureRecognizer alloc] init];
    [doubleTap addTarget:self action:@selector(doubleTapAction:)];
    doubleTap.numberOfTapsRequired=2;
    [self.view addGestureRecognizer:doubleTap];
    
    //建立单击和双击的一个依赖关系
    [singleTap requireGestureRecognizerToFail:doubleTap];
    
    //3.滑动手势
    UISwipeGestureRecognizer *swipeGesture=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureAction:)];
    swipeGesture.direction=UISwipeGestureRecognizerDirectionLeft|UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeGesture];
 
    //旋转手势
    UIRotationGestureRecognizer *rotationGestrue=[[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationGesture:)];
    [self.view addGestureRecognizer:rotationGestrue];
    
    //捏合手势
    UIPinchGestureRecognizer*pinche=[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
    [self.view addGestureRecognizer:pinche];
    
    //长按手势
    UILongPressGestureRecognizer *longPress=[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    longPress.minimumPressDuration=1;
    [self.view addGestureRecognizer:longPress];
    //平移手势
//    UIPanGestureRecognizer *pangesture=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
//    [self.view addGestureRecognizer:pangesture];
//    
    //屏幕边缘手势
    UIScreenEdgePanGestureRecognizer *screenPan=[[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgeGestureAction:)];
    screenPan.edges=UIRectEdgeRight;
    [self.view addGestureRecognizer:screenPan];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
