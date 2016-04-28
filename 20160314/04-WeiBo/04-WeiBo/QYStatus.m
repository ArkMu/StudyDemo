//
//  QYStatus.m
//  04-WeiBo
//
//  Created by qingyun on 16/3/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYStatus.h"
#import "Common.h"
#import "QYUser.h"
#import "NSDate+Status.h"
#import "NSString+Status.h"
//thumbnail_pic	string	缩略图片地址，没有时不返回此字段
//bmiddle_pic	string	中等尺寸图片地址，没有时不返回此字段
//original_pic	string	原始图片地址，没有时不返回此字段
@implementation QYStatus
+(instancetype)statusWithDictionary:(NSDictionary *)info{
    return [[self alloc] initWithDictionary:info];
}
-(instancetype)initWithDictionary:(NSDictionary *)info{
    if (self = [super init]) {
        //创建时间
        NSString *timeString = info[kStatusesCreatedAt];
        NSDate *createDate = [NSDate statusDateWithString:timeString];
        _created_at = [NSString createDateStringWithDate:createDate];
        //字符串型的微博ID
        _idstr = info[kStatusesIdStr];
        //微博信息内容
        _text = info[kStatusesText];
        //微博来源
        _source = [NSString sourceWithHtmlString:info[kStatusesSource]];
        //是否已收藏
        _favorited = [info[kStatusesFavorited] integerValue];
        //用户
        _user = [QYUser userWithDictionary:info[kStatusesUser]];
        //转发的微博
        NSDictionary *statusDict = info[kStatusesRetweetedStatus];
        if (statusDict) {
            _retweeted_status = [QYStatus statusWithDictionary:statusDict];
        }
        //转发数
        _reposts_count = [info[kStatusesRepostsCount] integerValue];
        //评论数
        _comments_count = [info[kStatusesCommentsCount] integerValue];
        //表态数
        _attitudes_count = [info[kStatusesAttitudesCount] integerValue];
        //图片集合
        _pic_urls = info[kStatusesPicUrls];
    }
    return self;
}
@end
