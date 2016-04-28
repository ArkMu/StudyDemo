//
//  DetailModel.h
//  Echo
//
//  Created by qingyun on 16/4/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ChannelModel;
@class UserModel;

@interface DetailModel : NSObject

@property (nonatomic, strong) NSString *lan_en;
@property (nonatomic, assign) NSInteger ad_id;
@property (nonatomic, strong) NSString *info;
@property (nonatomic, strong) NSString *exchange_count;
@property (nonatomic, strong) NSString *crosstalk_id;
@property (nonatomic, strong) NSString *check_status;
@property (nonatomic, strong) NSString *download_level;
@property (nonatomic, assign) NSInteger original;
@property (nonatomic, strong) NSString *comment_count;
@property (nonatomic, strong) NSString *activity_id;
@property (nonatomic, strong) NSString *author_id;
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *backup_id;
@property (nonatomic, strong) NSString *view_count;
@property (nonatomic, strong) NSString *length;
@property (nonatomic, strong) NSString *check_visition;
@property (nonatomic, strong) NSString *lan_kr;
@property (nonatomic, strong) NSString *lan_jp;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSString *hot_status;
@property (nonatomic, strong) NSString *user_id;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *commend_time;
@property (nonatomic, strong) NSString *source2;
@property (nonatomic, strong) NSString *status_mask;
@property (nonatomic, strong) NSString *web_source;
@property (nonatomic, strong) NSString *hls_key;
@property (nonatomic, strong) NSString *relay_count;
@property (nonatomic, strong) NSString *h5_clickbtn_count;
@property (nonatomic, strong) NSString *is_liquefying;
@property (nonatomic, strong) NSString *lan_cn;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *channel_id;
@property (nonatomic, strong) NSString *update_user_id;
@property (nonatomic, strong) NSString *Id;
@property (nonatomic, strong) NSString *create_time;
@property (nonatomic, strong) NSString *hot_time;
@property (nonatomic, strong) NSString *desp;
@property (nonatomic, strong) NSString *hls_status;
@property (nonatomic, strong) NSString *download_count;
@property (nonatomic, strong) NSString *update_time;
@property (nonatomic, strong) NSString *list_order;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *share_count;
@property (nonatomic, strong) NSString *pic_100;
@property (nonatomic, strong) NSString *pic_200;
@property (nonatomic, strong) NSString *pic_500;
@property (nonatomic, strong) NSString *pic_640;
@property (nonatomic, strong) NSString *pic_750;
@property (nonatomic, strong) NSString *pic_1080;

@property (nonatomic, strong) UserModel *userModel;

@property (nonatomic, assign) NSInteger is_xm;
@property (nonatomic, assign) NSInteger is_hot;

@property (nonatomic, strong) ChannelModel *channelModel;

@property (nonatomic, assign) NSInteger is_like;

@property (nonatomic, strong) NSArray *similar;

@property (nonatomic, strong) NSString *recommend_type;

@property (nonatomic, strong) NSArray *status_mask_array;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)modelWithDictionary:(NSDictionary *)dict;

@end
