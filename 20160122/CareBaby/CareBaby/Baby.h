//
//  Baby.h
//  CareBaby
//
//  Created by qingyun on 16/1/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Person.h"

@interface Baby : Person

@property (nonatomic, strong) id delegate;

- (instancetype)initWithDelegate:(id)delegate;

- (void)sleep;
- (void)getup;
- (void)feelHungry;
- (void)cry;
- (void)gotobed;

@end
