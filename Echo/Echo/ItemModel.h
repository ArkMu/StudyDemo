//
//  ItemModel.h
//  Echo
//
//  Created by qingyun on 16/4/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SoundModel;

@interface ItemModel : NSObject

@property (nonatomic, strong) NSString *Id;
@property (nonatomic, strong) NSString *obj_id;
@property (nonatomic, strong) NSString *obj_type;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *admin_id;
@property (nonatomic, strong) NSString *extension;
@property (nonatomic, strong) NSString *created_at;
@property (nonatomic, strong) NSString *updated_at;

@property (nonatomic, strong) SoundModel *soundModel;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)modelWithDictioanry:(NSDictionary *)dict;

@end
