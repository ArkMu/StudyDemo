//
//  RegisterViewController.m
//  UI概述
//
//  Created by qingyun on 16/1/26.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)commit:(UIButton *)sender {
    NSLog(@"commit.....");
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"回调成功！");
    }];
}
@end
