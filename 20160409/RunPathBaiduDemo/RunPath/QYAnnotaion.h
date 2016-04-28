//
//  QYAnnotaion.h
//  RunPath
//
//  Created by qingyun on 16/4/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>

//标注的类型
typedef enum : NSUInteger {
    kAnnotationStart,
    kAnnotationSuspend,
    kAnnotationEnd,
    kAnnotationNow
} AnnotationType;

@interface QYAnnotaion : NSObject<BMKAnnotation>

//遵守MKAnnotaion协议
@property (nonatomic, assign)CLLocationCoordinate2D coordinate;
@property (nonatomic, assign)AnnotationType type;

@end
