//
//  ScrollModel.m
//  Echo
//
//  Created by qingyun on 16/4/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ScrollModel.h"

#import "SoundModel.h"
#import "TopicModel.h"
#import "MvModel.h"
#import "PopupModel.h"

@implementation ScrollModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"mv"]) {
        _mvModel = [MvModel modelWithDictionary:(NSDictionary *)value];
    }
    
    if ([key isEqualToString:@"android_down_popup"]) {
        _popupModel = [PopupModel modelWithDictionary:(NSDictionary *)value];
    }
    if ([key isEqualToString:@"topic"]) {
        _topicModel = [TopicModel modelWithDictionary:(NSDictionary *)value];
    }
    if ([key isEqualToString:@"sound"]) {
        _soundModel = [SoundModel modelWithDictionary:(NSDictionary *)value];
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
