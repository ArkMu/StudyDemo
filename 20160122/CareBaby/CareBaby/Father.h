//
//  Father.h
//  CareBaby
//
//  Created by qingyun on 16/1/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Person.h"

@class Mother;

@interface Father : Person

@property (nonatomic, strong) Mother *wife;

- (void)gotoWork;

@end
