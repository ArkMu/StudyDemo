//
//  QYTabBarController.m
//  04-WeiBo
//
//  Created by qingyun on 16/3/1.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYTabBarController.h"

@interface QYTabBarController ()

@end

@implementation QYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTabBar];
    // Do any additional setup after loading the view.
}

//设置tabBar
-(void)setTabBar{
    //添加中间的 + 按钮 （宽：50,高：40）
    CGFloat btnW = 50;
    CGFloat btnH = 40;
    CGFloat btnX = self.tabBar.center.x - btnW / 2.0;
    CGFloat btnY = (CGRectGetHeight(self.tabBar.frame) - btnH) / 2;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.tabBar addSubview:btn];
    //设置frame
    btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    //设置背景颜色
    [btn setBackgroundColor:[UIColor orangeColor]];
    //设置图片
    [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    //添加点击事件
    [btn addTarget:self action:@selector(composeAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //设置btn的圆角
    btn.layer.cornerRadius = 4;
    btn.clipsToBounds = YES;
    
}

//点击 +
-(void)composeAction:(UIButton *)sender{
    
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
