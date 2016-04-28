//
//  SendVC.m
//  WeiBoDemo
//
//  Created by qingyun on 16/4/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "SendVC.h"
#import "AppDelegate.h"
#import "WeiboSDK.h"

@interface SendVC ()<WBHttpRequestDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation SendVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)send:(id)sender {
    NSString *urlString = @"https://api.weibo.com/2/statuses/update.json";
    AppDelegate *app = [[UIApplication sharedApplication] delegate];
    NSString *token = app.token;
    NSDictionary *params = @{@"access_token":token, @"status":self.textView.text};
    //使用微博OpenAPI,发微博
    [WBHttpRequest requestWithURL:urlString httpMethod:@"POST" params:params delegate:self withTag:nil];
}
- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - wb http

-(void)request:(WBHttpRequest *)request didFinishLoadingWithResult:(NSString *)result{
    NSLog(@"%@", result);
}

-(void)request:(WBHttpRequest *)request didFailWithError:(NSError *)error{
    NSLog(@"%@", error);
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
