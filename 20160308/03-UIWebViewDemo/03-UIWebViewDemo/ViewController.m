//
//  ViewController.m
//  03-UIWebViewDemo
//
//  Created by qingyun on 16/3/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate,UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置委托
    _textField.delegate = self;
    _webView.delegate = self;
    _webView.scalesPageToFit = YES;
    //加载网络请求
    [self loadRequestFromTextField];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)loadRequestFromTextField{
    NSURL *url = [NSURL URLWithString:_textField.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

#pragma mark  -UIWebViewDelegate
//开始加载请求
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

//请求加载完成
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

//请求加载失败
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    NSString *html = @"<html><marquee><h1>对不起，我错了！！！</h1></marquee></html>";
    [webView loadHTMLString:html baseURL:nil];
}

#pragma mark  - UITextField
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self loadRequestFromTextField];
    [textField resignFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
