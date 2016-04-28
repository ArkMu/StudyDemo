//
//  ViewController.m
//  02-TouchDemo
//
//  Created by qingyun on 16/3/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYtextField.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet QYtextField *textFIled;

@end

@implementation ViewController


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//取消响应
    [_textFIled resignFirstResponder];
    

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
