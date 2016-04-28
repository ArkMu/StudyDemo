//
//  Woman.h
//  深拷贝和浅拷贝
//
//  Created by qingyun on 16/1/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Man;

@interface Woman : NSObject <NSCopying>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) Man *boyfriend;


@end
