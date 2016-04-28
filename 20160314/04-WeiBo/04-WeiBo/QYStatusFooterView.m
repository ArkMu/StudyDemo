//
//  QYStatusFooterView.m
//  04-WeiBo
//
//  Created by qingyun on 16/3/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYStatusFooterView.h"
#import "QYStatus.h"
@interface QYStatusFooterView()
@property (weak, nonatomic) IBOutlet UIButton *retwitterBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
@property (weak, nonatomic) IBOutlet UIButton *likeBtn;

@end

@implementation QYStatusFooterView

- (void)awakeFromNib {
    // Initialization code
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor whiteColor];
    self.backgroundView = bgView;
}


-(void)setStatus:(QYStatus *)status{
    _status = status;
    
    NSInteger retwitterNum = status.reposts_count;
    NSString *retwitterBtnTitle = retwitterNum ? [NSString stringWithFormat:@"%ld",retwitterNum] : @"转发";
    [_retwitterBtn setTitle:retwitterBtnTitle forState:UIControlStateNormal];
    
    NSInteger commentNum = status.comments_count;
    NSString *commentBtnTitle = commentNum ? [NSString stringWithFormat:@"%ld",commentNum] : @"评论";
    [_commentBtn setTitle:commentBtnTitle forState:UIControlStateNormal];
    
    NSInteger likeNum = status.attitudes_count;
    NSString *likeBtnTitle = likeNum ? [NSString stringWithFormat:@"%ld",likeNum] : @"评论";
    [_likeBtn setTitle:likeBtnTitle forState:UIControlStateNormal];
    
}


- (IBAction)retwitter:(UIButton *)sender {
}
- (IBAction)comment:(UIButton *)sender {
}
- (IBAction)like:(UIButton *)sender {
}



@end
