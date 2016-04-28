//
//  Common.h
//  04-WeiBo
//
//  Created by qingyun on 16/3/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#ifndef Common_h
#define Common_h
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

static NSString * const kUserID = @"idstr";
static NSString * const kUserScreen_Name = @"screen_name";
static NSString * const kUserName = @"name";
static NSString * const kUserDescription = @"description";
static NSString * const kUserProfileImageUrl = @"profile_image_url";
static NSString * const kUserAvatar_Large = @"avatar_large";
static NSString * const kUserAvatar_HD = @"avatar_hd";
static NSString * const kUserFollowers = @"followers_count";
static NSString * const kUserFriends = @"friends_count";
static NSString * const kUserStatuses = @"statuses_count";
static NSString * const kUserFavourites = @"favourites_count";

//created_at	string	微博创建时间
//idstr	string	字符串型的微博ID
//text	string	微博信息内容
//source	string	微博来源
//favorited	boolean	是否已收藏，true：是，false：否
//thumbnail_pic	string	缩略图片地址，没有时不返回此字段
//bmiddle_pic	string	中等尺寸图片地址，没有时不返回此字段
//original_pic	string	原始图片地址，没有时不返回此字段
//user	object	微博作者的用户信息字段 详细
//retweeted_status	object	被转发的原微博信息字段，当该微博为转发微博时返回 详细
//reposts_count	int	转发数
//comments_count	int	评论数
//attitudes_count	int	表态数
//pic_urls          array 微博图片集合
static NSString * const kStatusesCreatedAt = @"created_at";
static NSString * const kStatusesIdStr = @"idstr";
static NSString * const kStatusesText= @"text";
static NSString * const kStatusesSource = @"source";
static NSString * const kStatusesFavorited = @"favorited";
static NSString * const kStatusesThumbnailPic = @"thumbnail_pic";
static NSString * const kStatusesBmiddlePic = @"bmiddle_pic";
static NSString * const kStatusesOriginalPic= @"original_pic";
static NSString * const kStatusesUser = @"user";
static NSString * const kStatusesRetweetedStatus = @"retweeted_status";
static NSString * const kStatusesRepostsCount= @"reposts_count";
static NSString * const kStatusesCommentsCount = @"comments_count";
static NSString * const kStatusesAttitudesCount = @"attitudes_count";
static NSString * const kStatusesPicUrls = @"pic_urls";
#endif /* Common_h */
