//
//  ResultVC.m
//  QRCode
//
//  Created by qingyun on 16/4/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ResultVC.h"

@implementation ResultVC

-(void)viewDidLoad{
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:self.result]];
    [self.webView loadRequest:req];
}

@end
