//
//  QYUser.m
//  04-WeiBo
//
//  Created by qingyun on 16/3/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYUser.h"
#import "Common.h"
@implementation QYUser
-(instancetype)initWithDictionary:(NSDictionary *)userInfo{
    if (self = [super init]) {
        //id
        _idstr = userInfo[kUserID];
        //用户昵称
        _screenName = userInfo[kUserScreen_Name];
        //友好显示名称
        _name = userInfo[kUserName];
        //用户个人描述
        _desc = userInfo[kUserDescription];
        //用户头像地址（中图），50×50像素
        _profileImageUrl = userInfo[kUserProfileImageUrl];
        //用户头像地址（大图），180×180像素
        _avatarLarge = userInfo[kUserAvatar_Large];
        //用户头像地址（高清），高清头像原图
        _avatarHd = userInfo[kUserAvatar_HD];
        //粉丝数
        _followersCount = [userInfo[kUserFollowers] integerValue];
        //关注数
        _friendsCount = [userInfo[kUserFriends] integerValue];
        //微博数
        _statusesCount = [userInfo[kUserStatuses] integerValue];
        //收藏数
        _favouritesCount = [userInfo[kUserFavourites] integerValue];
    }
    return self;
}
+(instancetype)userWithDictionary:(NSDictionary *)userInfo{
    return [[self alloc] initWithDictionary:userInfo];
}
@end
