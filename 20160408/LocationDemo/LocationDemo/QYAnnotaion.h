//
//  QYAnnotaion.h
//  LocationDemo
//
//  Created by qingyun on 16/4/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface QYAnnotaion : NSObject<MKAnnotation>

//遵守MKAnnotaion协议
@property (nonatomic, assign)CLLocationCoordinate2D coordinate;
@property (nonatomic, copy)NSString *title;

@end
