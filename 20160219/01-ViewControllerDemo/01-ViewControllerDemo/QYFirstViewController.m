//
//  QYFirstViewController.m
//  01-ViewControllerDemo
//
//  Created by qingyun on 16/2/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYFirstViewController.h"
#import "QYSecondViewController.h"
#import "ViewController.h"
@interface QYFirstViewController ()

@end

@implementation QYFirstViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        NSLog(@"🌹");
    }
    return self;
}

//重写loadView方法(要确保self.view不为nil)
//loadView使用场景，重新定义视图控制器的view为一个webView或者是tableView 等
-(void)loadView{
#if 0
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor yellowColor];
    self.view = view;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.view = tableView;
#else
    UIWebView *webView = [[UIWebView alloc] init];
    self.view = webView;
    //webView加在网址
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
#endif
    NSLog(@"%s",__func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSLog(@"%@",self.view);
    NSLog(@"%s",__func__);
    //创建btn
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 100, 100, 60);
    [btn setTitle:@"下一页" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    //添加事件监听
    [btn addTarget:self action:@selector(nextPage:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}

//点击下一页
-(void)nextPage:(UIButton *)sender{
#if 0
    QYSecondViewController *secondVC = [[QYSecondViewController alloc] init];
    [self presentViewController:secondVC animated:YES completion:nil];
#else
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *VC = [sb instantiateViewControllerWithIdentifier:@"vc"];
    [self presentViewController:VC animated:YES completion:nil];
#endif
}

//视图将要显示
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%s",__func__);
}

//视图已经显示
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%s",__func__);
}

//视图将要消失
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"%s",__func__);
}

//视图已经消失
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"%s",__func__);
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
