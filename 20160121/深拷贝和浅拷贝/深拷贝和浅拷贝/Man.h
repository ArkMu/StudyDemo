//
//  Person.h
//  深拷贝和浅拷贝
//
//  Created by qingyun on 16/1/21.
//  Copyright © 2016年 qingyun. All rights çreserved.
//

#import <Foundation/Foundation.h>
#import "Woman.h"

@interface Man : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) Woman *girlFriend;


@end
