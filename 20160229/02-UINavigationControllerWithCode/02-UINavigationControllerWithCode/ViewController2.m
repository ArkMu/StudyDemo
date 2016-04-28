//
//  ViewController2.m
//  02-UINavigationControllerWithCode
//
//  Created by qingyun on 16/2/29.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController3.h"
@interface ViewController2 ()

@end

@implementation ViewController2

-(void)nextPageVC{
    //self.navigationItem.title = @"";
    ViewController3 *vc3 = [[ViewController3 alloc] init];
    [self.navigationController pushViewController:vc3 animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:btn];
    //frame
    btn.frame = CGRectMake(100, 100, 100, 60);
    //title
    [btn setTitle:@"下一页" forState:UIControlStateNormal];
    //target action
    [btn addTarget:self action:@selector(nextPageVC) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
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
