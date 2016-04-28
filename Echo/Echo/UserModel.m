//
//  UserModel.m
//  Echo
//
//  Created by qingyun on 16/4/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (instancetype)initWithDictioanry:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

+ (instancetype)modelWithDictioanry:(NSDictionary *)dict {
    return [[self alloc] initWithDictioanry:dict];
}

@end
