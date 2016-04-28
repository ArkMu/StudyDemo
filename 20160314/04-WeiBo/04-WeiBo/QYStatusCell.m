//
//  QYStatusCell.m
//  04-WeiBo
//
//  Created by qingyun on 16/3/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYStatusCell.h"
#import "QYStatus.h"
#import "QYUser.h"
#import "UIImageView+WebCache.h"
#import "Common.h"
#define kImageEdge 8
#define kLineCount 3
#define kScreenWidth        [UIScreen mainScreen].bounds.size.width
#define kImageViewWidth     (kScreenWidth - kImageEdge * (kLineCount + 1)) / kLineCount

@interface QYStatusCell ()
@property (weak, nonatomic) IBOutlet UIImageView *avtarView;
@property (weak, nonatomic) IBOutlet UILabel *personName;
@property (weak, nonatomic) IBOutlet UILabel *createTime;
@property (weak, nonatomic) IBOutlet UILabel *source;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UIView *imageContentView;
@property (weak, nonatomic) IBOutlet UILabel *retwitterContent;
@property (weak, nonatomic) IBOutlet UIView *retwitterImageContentView;

@end

@implementation QYStatusCell

-(void)setStatus:(QYStatus *)status{
    _status = status;
    //设置头像
    NSString *imagePath = status.user.profileImageUrl;
    [_avtarView sd_setImageWithURL:[NSURL URLWithString:imagePath] placeholderImage:[UIImage imageNamed:@"social-user"]];
    _avtarView.layer.cornerRadius = 25;
    _avtarView.layer.masksToBounds = YES;
    //设置友好显示名称
    _personName.text = status.user.name;
    //创建时间
    _createTime.text = status.created_at;
    //来源
    _source.text = status.source;
    //内容
    _content.text = status.text;
    //判断是否有转发的微博
    if (status.retweeted_status) {
        //显示转发的微博
        [self layoutImageView:nil forView:_imageContentView];
        _retwitterContent.text = status.retweeted_status.text;
        [self layoutImageView:status.retweeted_status.pic_urls forView:_retwitterImageContentView];
    }else{
        //显示当前微博的图片
        [self layoutImageView:status.pic_urls forView:_imageContentView];
        _retwitterContent.text = nil;
        [self layoutImageView:nil forView:_retwitterImageContentView];
    }
}

//布局微博中图片
-(void)layoutImageView:(NSArray *)images forView:(UIView *)view{
    //移除view上的子视图
    for (UIView *subview in view.subviews) {
        [subview removeFromSuperview];
    }
    
    //更改view的高度的约束
    NSArray *constraints = view.constraints;
    for (NSLayoutConstraint *constraint in constraints) {
        //通过约束的属性来查找高度的约束
        if (constraint.firstAttribute == NSLayoutAttributeHeight) {
            constraint.constant = [self imageContentViewHeight:images];
        }
    }
    
    
    //添加子视图(imageView)到view
    for (int i = 0; i < images.count; i++) {
        //行
        NSInteger row = i / kLineCount;
        //列
        NSInteger column = i % kLineCount;
        
        CGFloat X = kImageViewWidth * column + (column + 1) * kImageEdge;
        CGFloat Y = kImageViewWidth * row + (row + 1) * kImageEdge;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(X, Y, kImageViewWidth, kImageViewWidth)];
        [view addSubview:imageView];
        
        //设置图片
        NSString *urlString = images[i][kStatusesThumbnailPic];
        [imageView sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:[UIImage imageNamed:@"social-placeholder"]];
        
        //防止图片被压缩变形
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.layer.masksToBounds = YES;
    }
    
}

//图片视图的父视图的高度
-(CGFloat)imageContentViewHeight:(NSArray *)picUrls{
    if (picUrls.count == 0) {
        return 0;
    }
    
    //图片的个数
    NSInteger imageCount = picUrls.count;
    //行数
    NSInteger line = (imageCount - 1) / kLineCount + 1;
    
    return line * kImageViewWidth + (line + 1) * kImageEdge;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
