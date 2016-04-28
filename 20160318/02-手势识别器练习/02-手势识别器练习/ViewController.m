//
//  ViewController.m
//  02-手势识别器练习
//
//  Created by qingyun on 16/3/18.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>
@property(nonatomic,strong)UIView *view2;
@end

@implementation ViewController
#pragma mark 重置view
-(void)restView{
    //回复视图
    [UIView animateWithDuration:.5 animations:^{
        _view2.transform=CGAffineTransformIdentity;
    }];
}

- (IBAction)longPressAction:(UILongPressGestureRecognizer *)sender {
    if (sender.state==UIGestureRecognizerStateBegan) {
      //1.声明一个menuitem对象
        UIMenuItem *item=[[UIMenuItem alloc] initWithTitle:@"重置" action:@selector(restView)];
      //2.获取menuItemController对象
        UIMenuController *menuController=[UIMenuController sharedMenuController];
        //2.1设置item
        menuController.menuItems=@[item];
    
        //2.2设置item显示的位置
        CGPoint point=[sender locationInView:sender.view];
        [menuController setTargetRect:CGRectMake(point.x, point.y, 0, 0) inView:sender.view];
          //成为第一响应者
        [self becomeFirstResponder];
        
        //3.显示菜单
        [menuController setMenuVisible:YES animated:YES];
    
        
        //标记要恢复的视图
        _view2=sender.view;
    }
}
//可以接收响应
-(BOOL)canBecomeFirstResponder{
    return YES;
}


- (IBAction)rotationGestureAction:(UIRotationGestureRecognizer *)sender {
    //1.获取当前旋转的view 旋转绝度值
    UIView *view=sender.view;
    //2旋转视图
    view.transform=CGAffineTransformRotate(view.transform, sender.rotation);
    //3.重置角度
    sender.rotation=0;   
}


#pragma 放大缩小
- (IBAction)PinchGestureAction:(UIPinchGestureRecognizer *)sender {
    //1获取scale 绝对值
    float scale=sender.scale;
    //2改变大小
    sender.view.transform=CGAffineTransformScale(sender.view.transform, scale, scale);
    
    //3.重置scale 为 1.
    sender.scale=1;
    
}
#pragma mark 平移
- (IBAction)panGestureAction:(UIPanGestureRecognizer *)sender {
    //1.获取到点 坐标系统点(0,0)
    CGPoint point=[sender translationInView:sender.view.superview];
    NSLog(@"=======%@",NSStringFromCGPoint(point));
    //2.根据点移动
    CGPoint centerPoint=sender.view.center;
    sender.view.center=CGPointMake(centerPoint.x+point.x, centerPoint.y+point.y);
    //sender.view.center=CGPointMake(point.x, point.y);
    //重置
    [sender setTranslation:CGPointZero inView:sender.view.superview];
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
   //这里可以区分 单个手势的操作

    //yes 表示手势都可以同时执行,NO表示当前只能执行一个手势
    return YES;
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
