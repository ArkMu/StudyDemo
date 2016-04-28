//
//  main.m
//  CareBaby
//
//  Created by qingyun on 16/1/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Clock.h"
#import "Baby.h"
#import "Mother.h"
#import "Father.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Clock *clock = [Clock new];
        
        Father *pp = [[Father alloc] initWithName:@"👨"];
        Mother *mm = [[Mother alloc] initWithName:@"👩"];
        pp.wife = mm;
        
        Baby *bb = [[Baby alloc] initWithDelegate:pp];
        
        [NSTimer scheduledTimerWithTimeInterval:0.5 target:clock selector:@selector(timing:) userInfo:@{@"bb":bb,@"pp":pp} repeats:YES];
        
        [[NSRunLoop mainRunLoop] run];
        
    }
    return 0;
}
