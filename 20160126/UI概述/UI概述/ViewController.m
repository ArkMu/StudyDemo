//
//  ViewController.m
//  UI概述
//
//  Created by qingyun on 16/1/26.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

#import "HomeViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *pwdLabel;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (nonatomic, strong) UITextField *userInfo;
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
    
    // UILabel 是标签控件用来显示简短文字内容
    UILabel *userLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 80, 44)];
    userLabel.backgroundColor = [UIColor greenColor]; // 背景颜色
    userLabel.text = @"用户"; // 文本内容
    userLabel.textAlignment = NSTextAlignmentCenter; // 对齐方式
    
    CGRect userInfoRect = CGRectMake(50+userLabel.frame.size.width+30, userLabel.frame.origin.y, self.view.frame.size.width-50-80-30-50, 44);
    self.userInfo = [[UITextField alloc] initWithFrame:userInfoRect];
    self.userInfo.backgroundColor = [UIColor lightGrayColor];
    
    // UITextField 是文本框，用来获取用户输入文本内容
    _userInfo.placeholder = @"请输入用户名";// 内容提示
    _userInfo.delegate = self; // 设置文本的代理为当前视图控制器
    _userInfo.tag = 1; // 设置文本的标记，用来区分文本框
    
    self.password.tag = 2;
    self.password.delegate = self;
    
    // UIImageView 是图片视图，用来显示图片
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 300, self.view.frame.size.width-50*2, 100)];
    _imageView.image = [UIImage imageNamed:@"4.jpg"];
    
    
    
    // 所有的UIView最终在屏幕上显示都需要被添加到 self.view
    [self.view addSubview:userLabel];
    [self.view addSubview:_userInfo];
    [self.view addSubview:_imageView];
}

#pragma mark - delegate

// 这个方法是UITextfiled的代理方法，用来监控用户的实时输入
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"tag >>>> %ld", textField.tag);
//    NSLog(@"string >>>> %@", string);
    if ([textField.text isEqualToString:@"qy"]) {
        NSLog(@"string >>>> %@", textField.text);
        return YES;
    }
    return YES;
}
// 开始编辑的时候
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    // 使用如下逻辑可以让键盘弹出的时候顶起 界面
    CGRect oldFrame = self.view.frame;
    CGRect newFrame = CGRectMake(0, -300, oldFrame.size.width, oldFrame.size.height);

    // UIView 的简单动画
    self.view.window.backgroundColor = [UIColor whiteColor];
    [UIView animateWithDuration:2 animations:^{
        self.view.frame = newFrame;
    }];
}

#pragma mark - event

// 这个方法是按钮的点击事件
- (IBAction)login:(UIButton *)sender {
    NSLog(@"登陆。。。。。");

    
    //HomeViewController *homeVC/Volumes/DISK_IMG = [[HomeViewController alloc] init];
    // 取出 StoryBoard
    UIStoryboard *mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    // 再从StroyBoard中取出对应的视图控制器
    HomeViewController *homeVC = [mainSB instantiateViewControllerWithIdentifier:@"home"];
    // 往对应的视图控制器跳转
        );
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.userInfo resignFirstResponder];
  
}

@end
