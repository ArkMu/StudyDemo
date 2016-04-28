//
//  Baby.m
//  CareBaby
//
//  Created by qingyun on 16/1/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Baby.h"

#import "NSObject+CareBaby.h"

@implementation Baby

- (instancetype)initWithDelegate:(id)delegate
{
    if (self = [super initWithName:@"👶"]) {
        _delegate = delegate;
    }
    return self;
}

- (void)sleep
{
    NSLog(@"😪😪😪😪😪😪😪😪");
}

- (void)getup
{
    NSLog(@"😊😊😊😊😊😊😊😊");
    [self.delegate wear:self];
}

- (void)feelHungry
{
    NSLog(@"(⊙o⊙)…。。。。。。。。");
    [self.delegate feed:self];
}

- (void)cry
{
    NSLog(@"😢😢😢😢😢😢😢😢");
    [self.delegate play:self];
}

- (void)gotobed
{
    [self.delegate coax:self];
}

@end
