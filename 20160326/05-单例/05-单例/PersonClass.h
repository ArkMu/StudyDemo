//
//  PersonClass.h
//  05-单例
//
//  Created by qingyun on 16/3/26.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonClass : NSObject
@property(nonatomic,strong)NSString *name;
/*
 * share
 * defalut
 * stand
 */
+(instancetype)shareClass;


@end
