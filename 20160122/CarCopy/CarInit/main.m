//
//  main.m
//  CarInit
//
//  Created by qingyun on 16/1/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Car.h"
#import "Tire.h"
#import "AllWeatherTire.h"
#import "Engine.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSMutableArray *tires = [NSMutableArray arrayWithCapacity:4];
        
        Tire *leftFront = [[Tire alloc] initWithPressure:1 andTireDeepth:15.00F];
        AllWeatherTire *leftBack = [[AllWeatherTire alloc] initWithrandHandling:10.11F andSnowHandling:15.12F];
        
        [tires addObjectsFromArray:@[leftFront, [leftFront copy], leftBack, [leftBack copy]]];
        
        Engine *eg = [[Engine alloc] initWithName:@"青云" andPower:6.0];
        Car *car3 = [[Car alloc] initWithTires:tires andEngine:eg];
        
        
        NSLog(@"car3 >>>> %@", car3);
        
        NSArray *cars = @[[car3 copy],[car3 copy],[car3 copy],[car3 copy],[car3 copy],[car3 copy]];
        
        for (Car *c in cars) {
            NSLog(@"c >>>>> %p %@", c, c);
        }
    }
    return 0;
}
