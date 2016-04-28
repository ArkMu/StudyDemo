//
//  QYVIewE.m
//  01-TouchDemo
//
//  Created by qingyun on 16/3/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYVIewE.h"

@implementation QYVIewE


-(void)singTap{
    NSLog(@"=====单击1");
}

-(void)doubleTap{
    NSLog(@"=======双击");
}

-(void)addsubVIewForPoint:(CGPoint)Point{
//添加视图
    UIView *drawView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    drawView.backgroundColor=[UIColor redColor];
    drawView.center=Point;
    [self addSubview:drawView];
}

//响应事件
//开始
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //NSLog(@"====%s",__func__);
    //获取单个touch 手指
    UITouch *touch=[touches anyObject];
    //点击次数
    NSInteger count=touch.tapCount;
  //  NSLog(@"=======%ld",count);
    if(count==1){
        //单击
        //[self singTap];
        [self performSelector:@selector(singTap) withObject:nil afterDelay:.5];
    }else if (count==2){
       //双击
        //取消单击事件
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(singTap) object:nil];
        [self doubleTap];
    }
    
    //获取当前点的位置
  CGPoint point=[touch locationInView:self];
    [self addsubVIewForPoint:point];
   NSLog(@"=========%@",NSStringFromCGPoint(point));
}
//移动
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"=====移动");
    //获取当前的点
    UITouch *touch=[touches anyObject];
    CGPoint point=[touch locationInView:self];
    [self addsubVIewForPoint:point];
}


-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"====end");
   //获取手指
    UITouch *touch=[touches anyObject];
    //获取当前的点
    CGPoint point=[touch locationInView:self];
    [self addsubVIewForPoint:point];
    

}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
