//
//  NSObject+CareBaby.m
//  CareBaby
//
//  Created by qingyun on 16/1/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "NSObject+CareBaby.h"

@implementation NSObject (CareBaby)

- (void)wear:(id)baby
{
    NSLog(@"%@:👔👔👔👔👔 >>> %@", self, baby);
}

- (void)feed:(id)baby
{
    NSLog(@"%@:🍼🍼🍼🍼🍼 >>> %@", self, baby);
}

- (void)play:(id)baby
{
    NSLog(@"%@:🚗🚗🚗🚗🚗 >>> %@", self, baby);
}

- (void)coax:(id)baby
{
    NSLog(@"%@:🌛🌛🌛🌛🌛 >>> %@", self, baby);
}

@end
