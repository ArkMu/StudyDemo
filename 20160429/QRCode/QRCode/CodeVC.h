//
//  CodeVC.h
//  QRCode
//
//  Created by qingyun on 16/4/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CodeVC : UIViewController
@property (strong, nonatomic) IBOutlet UIView *preView;//显示预览的内容
@property (strong, nonatomic) IBOutlet UIImageView *boardImageView;//显示扫描的边框


@end
