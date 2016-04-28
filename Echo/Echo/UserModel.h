//
//  UserModel.h
//  Echo
//
//  Created by qingyun on 16/4/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (nonatomic, strong) NSString *Id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *photo;
@property (nonatomic, strong) NSString *pay_class;
@property (nonatomic, strong) NSString *pay_status;
@property (nonatomic, strong) NSString *famous_status;
@property (nonatomic, strong) NSString *followed_count;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *famous_type;
@property (nonatomic, strong) NSString *famous_icon;
@property (nonatomic, strong) NSString *avatar_150;
@property (nonatomic, strong) NSString *avatar_100;
@property (nonatomic, strong) NSString *avatar_50;

@property (nonatomic, assign) NSInteger is_follow;

- (instancetype)initWithDictioanry:(NSDictionary *)dict;
+ (instancetype)modelWithDictioanry:(NSDictionary *)dict;

@end
