//
//  QYviewA.m
//  01-TouchDemo
//
//  Created by qingyun on 16/3/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYviewA.h"

@implementation QYviewA
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSArray *allTouchs=[touches allObjects];
    //如果多点触摸必须设置 self.multipleTouchEnabled=YES;
   
    
    NSLog(@"======%ld",allTouchs.count);
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
