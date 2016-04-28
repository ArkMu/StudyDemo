//
//  ChannelModel.h
//  Echo
//
//  Created by qingyun on 16/4/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChannelModel : NSObject

@property (nonatomic, assign) NSInteger Id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, assign) NSInteger user_id;

@property (nonatomic, strong) NSString *info;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) NSInteger tag_id;
@property (nonatomic, assign) NSInteger sound_count;
@property (nonatomic, assign) NSInteger follow_count;
@property (nonatomic, assign) NSInteger like_count;
@property (nonatomic, assign) NSInteger share_count;
@property (nonatomic, assign) NSInteger update_user_id;
@property (nonatomic, assign) NSInteger list_order;
@property (nonatomic, assign) NSInteger create_time;
@property (nonatomic, assign) NSInteger update_time;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString *desp;

@property (nonatomic, strong) NSString *pic_100;
@property (nonatomic, strong) NSString *pic_200;
@property (nonatomic, strong) NSString *pic_500;
@property (nonatomic, strong) NSString *pic_640;
@property (nonatomic, strong) NSString *pic_750;
@property (nonatomic, strong) NSString *pic_1080;

@property (nonatomic, strong) NSMutableArray *soundArr;

@property (nonatomic, assign) NSInteger is_like;
@property (nonatomic, strong) NSArray *similar;
@property (nonatomic, assign) NSInteger *recommend_type;
@property (nonatomic, strong) NSArray *status_mask_array;


- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)modelWithDictionary:(NSDictionary *)dict;

@end
