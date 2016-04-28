//
//  ChannelModel.m
//  Echo
//
//  Created by qingyun on 16/4/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ChannelModel.h"

#import "SoundModel.h"

@implementation ChannelModel

//- (instancetype)initWithDictionary:(NSDictionary *)dict {
//    self = [super init];
//    if (self) {
//        _Id = [dict[@"id"] integerValue];
//        _name = dict[@"name"];
//        _pic = dict[@"pic"];
//        _user_id = [dict[@"user_id"] integerValue];
//    }
//    
//    return self;
//}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        _Id = (NSInteger)value;
    }
    if ([key isEqualToString:@"hot_sounds"]) {
        NSArray *arr = (NSArray *)value;
        
        _soundArr = [NSMutableArray array];
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            SoundModel *model = [SoundModel modelWithDictionary:obj];
            [_soundArr addObject:model];
        }];
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
