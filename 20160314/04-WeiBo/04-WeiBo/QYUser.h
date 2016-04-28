//
//  QYUser.h
//  04-WeiBo
//
//  Created by qingyun on 16/3/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

//idstr	string	字符串型的用户UID
//screen_name	string	用户昵称
//name	string	友好显示名称
//description	string	用户个人描述

//profile_image_url	string	用户头像地址（中图），50×50像素
//avatar_large	string	用户头像地址（大图），180×180像素
//avatar_hd	string	用户头像地址（高清），高清头像原图

//followers_count	int	粉丝数
//friends_count	int	关注数
//statuses_count	int	微博数
//favourites_count	int	收藏数
@interface QYUser : NSObject
@property (nonatomic, strong) NSString *idstr;
@property (nonatomic, strong) NSString *screenName;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *profileImageUrl;
@property (nonatomic, strong) NSString *avatarLarge;
@property (nonatomic, strong) NSString *avatarHd;
@property (nonatomic) NSInteger followersCount;
@property (nonatomic) NSInteger friendsCount;
@property (nonatomic) NSInteger statusesCount;
@property (nonatomic) NSInteger favouritesCount;

-(instancetype)initWithDictionary:(NSDictionary *)userInfo;
+(instancetype)userWithDictionary:(NSDictionary *)userInfo;

@end
