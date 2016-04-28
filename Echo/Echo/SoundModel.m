//
//  SoundModel.m
//  Echo
//
//  Created by qingyun on 16/4/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "SoundModel.h"

#import "UserModel.h"
#import "ChannelModel.h"

@implementation SoundModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"user"]) {
        _userModel = [UserModel modelWithDictioanry:(NSDictionary *)value];
    }
    if ([key isEqualToString:@"channel"]) {
        _channelModel = [ChannelModel modelWithDictionary:(NSDictionary *)value];
    }
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

+ (instancetype)modelWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

@end
