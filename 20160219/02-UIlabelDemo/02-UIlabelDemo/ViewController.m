//
//  ViewController.m
//  02-UIlabelDemo
//
//  Created by qingyun on 16/2/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#define QYScreenW [UIScreen mainScreen].bounds.size.width
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建并添加label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 60)];
    [self.view addSubview:label];
    label.backgroundColor = [UIColor grayColor];
    
    //设置文本
    label.text = @"hello,world, hello,qingyun!";
    //设置文本的颜色
    label.textColor = [UIColor redColor];
    
    //阴影
    label.shadowColor = [UIColor greenColor];
    label.shadowOffset = CGSizeMake(5, -5);
    //对齐方式
    label.textAlignment = NSTextAlignmentCenter;
    
    //高亮状态下的字体颜色
    label.highlightedTextColor = [UIColor yellowColor];
    label.highlighted = YES;
    //多行显示的时候，显示的方式
    label.lineBreakMode = NSLineBreakByWordWrapping;
    //行数(0代表不限制行数)
    label.numberOfLines = 1;
    //根据UILabel大小调整字体大小
    label.adjustsFontSizeToFitWidth = YES;
    
    //跑马灯label
    UILabel *scrollLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,300 , 80, 50)];
    [self.view addSubview:scrollLabel];
    
    scrollLabel.text = @"1512,真棒！";
    scrollLabel.backgroundColor = [UIColor lightGrayColor];
    scrollLabel.font = [UIFont boldSystemFontOfSize:14];
    
    
    
    //动画
#if 0
    [UIView animateWithDuration:2 animations:^{
        scrollLabel.frame = CGRectMake(QYScreenW - 80, 300, 80, 50);
    } completion:^(BOOL finished) {
        scrollLabel.frame = CGRectMake(0, 300, 80, 50);
    }];
#else
    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
        scrollLabel.frame = CGRectMake(QYScreenW - 80, 300, 80, 50);
    } completion:^(BOOL finished) {
        
    }];
#endif
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
