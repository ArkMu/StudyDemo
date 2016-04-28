//
//  ResultVC.h
//  QRCode
//
//  Created by qingyun on 16/4/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultVC : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (nonatomic, strong)NSString *result;

@end
