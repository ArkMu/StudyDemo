//
//  SoundModel.h
//  Echo
//
//  Created by qingyun on 16/4/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserModel;
@class ChannelModel;

@interface SoundModel : NSObject

@property (nonatomic, strong) NSString *Id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, strong) NSString *channel_id;
@property (nonatomic, strong) NSString *user_id;
@property (nonatomic, strong) NSString *source;

@property (nonatomic, strong) UserModel *userModel;

@property (nonatomic, strong) NSString *info;
@property (nonatomic, strong) NSString *pic_100;
@property (nonatomic, strong) NSString *pic_200;
@property (nonatomic, strong) NSString *pic_500;
@property (nonatomic, strong) NSString *pic_640;
@property (nonatomic, strong) NSString *pic_750;
@property (nonatomic, strong) NSString *pic_1000;

@property (nonatomic, assign) NSInteger is_hot;
@property (nonatomic, strong) NSString *commend_time;
@property (nonatomic, strong) NSString *length;
@property (nonatomic, strong) NSString *share_count;
@property (nonatomic, strong) NSString *like_count;
@property (nonatomic, strong) NSString *comment_count;
@property (nonatomic, strong) NSString *status_mask;

@property (nonatomic,strong) NSString *view_count;

@property (nonatomic, strong) ChannelModel *channelModel;

@property (nonatomic, strong) NSArray *status_mask_array;


- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)modelWithDictionary:(NSDictionary *)dict;

@end
