//
//  ViewController.m
//  01-AFnetWorkingDemo
//
//  Created by qingyun on 16/3/25.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "AFURLsessionViewController.h"
#import "AFhttpSessionViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)PushActionUrlSession:(id)sender {
    //push下个页面
    AFURLsessionViewController *session=[[AFURLsessionViewController alloc] init];
    [self.navigationController pushViewController:session animated:YES];

}
- (IBAction)PushActionHttpSession:(id)sender {
    AFhttpSessionViewController *session=[[AFhttpSessionViewController alloc] init];
    [self.navigationController pushViewController:session animated:YES];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
