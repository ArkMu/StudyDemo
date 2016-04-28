//
//  Clock.h
//  CareBaby
//
//  Created by qingyun on 16/1/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Clock : NSObject

@property (nonatomic) int hour;

- (void)timing:(NSTimer *)timer;

@end
