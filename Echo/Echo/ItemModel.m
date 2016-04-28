//
//  ItemModel.m
//  Echo
//
//  Created by qingyun on 16/4/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ItemModel.h"

#import "SoundModel.h"

@implementation ItemModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
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

+ (instancetype)modelWithDictioanry:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

@end
