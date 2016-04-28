//
//  ScrollModel.h
//  Echo
//
//  Created by qingyun on 16/4/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SoundModel;
@class TopicModel;
@class MvModel;
@class PopupModel;

@interface ScrollModel : NSObject

@property (nonatomic, strong) NSString *start_time;
@property (nonatomic, strong) NSString *online;
@property (nonatomic, strong) NSString *create_time;
@property (nonatomic, strong) NSString *end_time;
@property (nonatomic, strong) NSString *click_count;
@property (nonatomic, strong) NSString *Id;
@property (nonatomic, strong) NSString *ad_id;
@property (nonatomic, strong) NSString *create_user_id;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *platform;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *turn;
@property (nonatomic, strong) NSString *show_count;
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, strong) NSString *extension;
@property (nonatomic, strong) NSString *position;


@property (nonatomic, strong) MvModel *mvModel;
@property (nonatomic, strong) TopicModel *topicModel;
@property (nonatomic, strong) SoundModel *soundModel;
@property (nonatomic, strong) PopupModel *popupModel;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)modelWithDictionary:(NSDictionary *)dict;


@end
