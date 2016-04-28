//
//  WomanStar.h
//  深拷贝和浅拷贝
//
//  Created by qingyun on 16/1/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Woman.h"
#import "Dog.h"
@interface WomanStar : Woman

@property (nonatomic, strong) NSString *aliasName;
@property (nonatomic, strong) Dog *dog;

- (void)play;

@end
