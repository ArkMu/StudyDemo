//
//  SqliteVC.m
//  02-数据持久化
//
//  Created by qingyun on 16/3/29.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "SqliteVC.h"
#import "InsertVC.h"
#import "SelectVC.h"
#import "UpdateVC.h"
#import "DeleteVC.h"
@interface SqliteVC ()

@end

@implementation SqliteVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)sqliteAction:(UIButton *)sender {
    
    UIViewController *controller;
    switch (sender.tag) {
        case 1:{
            controller=[[InsertVC alloc] init];
        }
            break;
        case 4:
        {
            controller=[[SelectVC alloc] init];
        }
            break;
        case 2:
        {
            controller=[[UpdateVC alloc] init];
        }
            break;
        case 3:
        {
            controller=[[DeleteVC alloc] init];
        }
            break;
        default:
            break;
       
            
    }
    if (controller) {
          [self.navigationController pushViewController:controller animated:YES];
    }
  
    
    
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
