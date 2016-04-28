//
//  ViewController.m
//  LocationDemo
//
//  Created by qingyun on 16/4/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "QYAnnotaion.h"

@interface ViewController ()<CLLocationManagerDelegate, MKMapViewDelegate>

@property (nonatomic, strong)CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //实例化
    self.locationManager = [[CLLocationManager alloc] init];
    //申请用户授权
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    //设置定位的精确度
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    //设置位置点更新的触发条件
    self.locationManager.distanceFilter = 10.f;
    
    //设置delegate
    self.locationManager.delegate = self;
    
    //GPS服务可用
    if ([CLLocationManager locationServicesEnabled]) {
        //当前定位服务可用
        [self.locationManager startUpdatingLocation];
    }else{
        NSLog(@"定位服务不可用");
    }
    
    self.mapView.delegate = self;
    
}

#pragma mask - location delegate

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"%@", error);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    //最后一个点,最准确
    CLLocation *location = [locations lastObject];
    NSLog(@"%@", location);
    
    
//    //添加一个标注在地图上,显示出在地图上的位置
//    //系统提供的遵守MAnnotaiton协议的对象
//    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
//    //标注中必须设置的属性,标注的位置
//    point.coordinate = location.coordinate;
//    point.title = @"这儿";
//    point.subtitle = @"定位的位置";
//    
//    //将标注添加到地图视图中
//    [self.mapView addAnnotation:point];
    
    QYAnnotaion *annotaion = [[QYAnnotaion alloc] init];
    annotaion.coordinate = location.coordinate;
    annotaion.title = @"开始";
    
    [self.mapView addAnnotation:annotaion];

    
    //聚焦地图的显示区域
    MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
    [self.mapView setRegion:region];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    if ([annotation isKindOfClass:[QYAnnotaion class]]) {
        //复用的标识符
        static NSString *identerfire = @"qyAnnotaion";
        //先从复用队列中出队
        MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:identerfire];
        //队列中没有,则初始化
        if (!view) {
            view = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identerfire];
        }
        //设置视图的内容
        view.annotation = annotation;
        [view setImage:[UIImage imageNamed:@"map_start_icon"]];
        //返回标注视图
        return view;
    }
    return nil;
    
}

@end
