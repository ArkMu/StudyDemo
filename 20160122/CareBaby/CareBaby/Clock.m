//
//  Clock.m
//  CareBaby
//
//  Created by qingyun on 16/1/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Clock.h"
#import "Baby.h"
#import "Father.h"

@implementation Clock

- (void)timing:(NSTimer *)timer
{
    _hour++;
    NSLog(@"%d:00", _hour);
    
    Baby *bb = timer.userInfo[@"bb"];
    Father *pp = timer.userInfo[@"pp"];
    
    switch (_hour) {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
            // 孩子睡觉
            [bb sleep];
            break;
        case 8:
            // 孩子醒了
            [bb getup];
            break;
        case 9:
            // 爸爸上班，替换代理
            [pp gotoWork];
            bb.delegate = pp.wife;
            break;
        case 12:
            // 孩子饿了
            [bb feelHungry];
            break;
        case 15:
            // 孩子哭了
            [bb cry];
            break;
        case 18:
            // 孩子饿了
            [bb feelHungry];
            break;
        case 20:
            // 孩子睡了
            [bb gotobed];
            break;
        case 22:
            // 一天结束
            NSLog(@"Good day,good night 👪！");       
            [timer invalidate];
            break;
        default:
            break;
    }
}

@end
