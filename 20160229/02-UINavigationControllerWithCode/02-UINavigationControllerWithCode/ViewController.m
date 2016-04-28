//
//  ViewController.m
//  02-UINavigationControllerWithCode
//
//  Created by qingyun on 16/2/29.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
@interface ViewController ()

@end

@implementation ViewController

-(void)nextPageVC{
    //self.navigationItem.title = @"";
    self.navigationItem.prompt = nil;
    ViewController2 *vc2 = [[ViewController2 alloc] init];
    [self.navigationController pushViewController:vc2 animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:btn];
    //frame
    btn.frame = CGRectMake(100, 64, 100, 60);
    //title
    [btn setTitle:@"下一页" forState:UIControlStateNormal];
    //target action
    [btn addTarget:self action:@selector(nextPageVC) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];
    
    
    //设置导航栏
    [self setNavigationBar];
    //设置工具栏
    [self setToolBar];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)setToolBar{
    //设置工具栏显示
    self.navigationController.toolbarHidden = NO;
    //创建barBtnItems
    UIBarButtonItem *wxBarBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"微信" style:UIBarButtonItemStylePlain target:self action:nil];
    
    UIBarButtonItem *qqBarBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"qq" style:UIBarButtonItemStylePlain target:self action:nil];
    
    UIBarButtonItem *wbBarBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"微博" style:UIBarButtonItemStylePlain target:self action:nil];
    
    //间距
    //固定间距
    UIBarButtonItem *fixedSpaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    fixedSpaceItem.width = 100;
    //可变间距
    UIBarButtonItem *flexibleSpaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    NSArray *items = @[fixedSpaceItem,wxBarBtnItem,flexibleSpaceItem,qqBarBtnItem,flexibleSpaceItem,wbBarBtnItem,fixedSpaceItem];
    
    //设置工具栏内容（barBtnItems）
    [self setToolbarItems:items animated:YES];
}

//-(void)setNavigationBar{
//    //导航栏上内容（leftBarButtonItem 、title/titleView 、rightBarButtonItem）
//#if 0
//    //创建一个系统类型的BarBtnItem
//    UIBarButtonItem *leftBarBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(leftBarBtnItemAction:)];
//    
//    //用标题创建一个BarBtnItem
//    UIBarButtonItem *leftBarBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"搜索" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarBtnItemAction:)];
//    
//    //利用自定义视图来创建一个BarBtnItem
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    //设置标题、标题颜色、添加事件
//    [btn setTitle:@"搜索" forState:UIControlStateNormal];
//    [btn setT
//
@end




