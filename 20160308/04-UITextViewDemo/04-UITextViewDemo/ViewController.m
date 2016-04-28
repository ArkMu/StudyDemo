//
//  ViewController.m
//  04-UITextViewDemo
//
//  Created by qingyun on 16/3/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景颜色
    _textView.backgroundColor = [UIColor redColor];
    
    _textView.delegate = self;
    
    [self configTextView];
    
    //注册通知（键盘将要显示和消失）
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardHandle:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardHandle:) name:UIKeyboardWillHideNotification object:nil];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)dealloc{
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

-(void)keyBoardHandle:(NSNotification *)notification{
    NSLog(@"%@",notification);
    
    CGRect endRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat endY = CGRectGetMidY(endRect);
    
    CGRect beginRect = [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGFloat beginY = CGRectGetMidY(beginRect);
    
    CGFloat detalY = endY - beginY;
    
    CGRect frame = _textView.frame;
    frame.size.height += detalY;
    
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView animateWithDuration:duration animations:^{
        _textView.frame = frame;
    }];
}


-(void)configTextView{
    //enim 黑体
    NSRange boldRange = [_textView.text rangeOfString:@"enim"];
    //exercitation 下划线
    NSRange underLineRange = [_textView.text rangeOfString:@"exercitation"];
    
    //consequat 背景颜色
    NSRange bgRange = [_textView.text rangeOfString:@"consequat"];
    
    //deserunt 字体颜色
    NSRange tintColorRange = [_textView.text rangeOfString:@"deserunt"];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:_textView.attributedText];

    [attributedString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:26] range:boldRange];
    
    [attributedString addAttribute:NSUnderlineStyleAttributeName value:@1 range:underLineRange];
    
    [attributedString addAttribute:NSBackgroundColorAttributeName value:[UIColor whiteColor] range:bgRange];
    
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor cyanColor] range:tintColorRange];
    
    //添加图片
    //文本附着 图片
    NSTextAttachment *attachMent = [[NSTextAttachment alloc] init];
    attachMent.image = [UIImage imageNamed:@"text_view_attachment"];
    NSAttributedString *imageString = [NSAttributedString attributedStringWithAttachment:attachMent];
    [attributedString appendAttributedString:imageString];
    
    _textView.attributedText = attributedString;
    
}

#pragma mark  -UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView{
    UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(finishAction:)];
    self.navigationItem.rightBarButtonItem = rightBarBtnItem;
}

-(void)finishAction:(UIBarButtonItem *)item{
    [_textView resignFirstResponder];
    self.navigationItem.rightBarButtonItem = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
