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
//        Car *smart = [[Car alloc] initWithBrand:@"Benz" andPrice:200000];
//        
//        NSLog(@"smart >>> %@", smart);
    
        NSMutableArray *tires = [NSMutableArray arrayWithCapacity:4];
        Tire *leftFront = [[Tire alloc] initWithPressure:1 andTireDeepth:15.00F];
        Tire *rightFront = [[Tire alloc] initWithPressure:1 andTireDeepth:15.01F];
        
        AllWeatherTire *leftBack = [[AllWeatherTire alloc] initWithrandHandling:10.11F andSnowHandling:15.12F];
        AllWeatherTire *rightBack = [[AllWeatherTire alloc] initWithrandHandling:10.12F andSnowHandling:15.12F];
        
        [tires addObjectsFromArray:@[leftBack, leftFront, rightFront, rightBack]];
//        Car *car1 = [[Car alloc] initWithTires:tires];
//        
        Engine *eg = [[Engine alloc] initWithName:@"青云" andPower:6.0];
//        Car *car2 = [[Car alloc] initWithEngine:eg];
        
        
        Car *car3 = [[Car alloc] initWithTires:tires andEngine:eg];
        
        
        NSLog(@"car3 >>>> %@", car3);
        
        
    
    }
    return 0;
}
