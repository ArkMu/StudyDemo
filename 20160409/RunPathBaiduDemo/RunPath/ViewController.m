//
//  ViewController.m
//  RunPath
//
//  Created by qingyun on 16/4/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>//百度地图
#import <CoreLocation/CoreLocation.h>
#import "QYAnnotaion.h"

@interface ViewController ()<CLLocationManagerDelegate, BMKMapViewDelegate>

@property (weak, nonatomic) IBOutlet BMKMapView *mapView;
@property (strong, nonatomic)CLLocationManager *locationManager;
@property (nonatomic, strong)CLLocation *nowLocation;//定位到的当前点
@property (nonatomic, weak)QYAnnotaion *nowAnnotaion;//指向当前添加的标注
@property (nonatomic, strong)NSMutableArray *allLocations;//所经过的所有的点

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //配置定位服务
    self.locationManager = [[CLLocationManager alloc] init];
    //delegate
    self.locationManager.delegate = self;
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        //请求用户授权
        [self.locationManager requestAlwaysAuthorization];
    }
    //精确度
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    //定位的触发条件,距离
    self.locationManager.distanceFilter = 10.f;
    
    self.mapView.delegate = self;
    
}
- (IBAction)run:(id)sender {
    if ([CLLocationManager locationServicesEnabled]) {
        [self.locationManager startUpdatingLocation];
    }else{
        NSLog(@"不能进行定位");
    }
}
- (IBAction)pause:(id)sender {
    //停止定位
    [self.locationManager stopUpdatingLocation];
    //在当前点添加一个暂停的标注
    QYAnnotaion *anno = [[QYAnnotaion alloc] init];
    anno.coordinate = self.nowLocation.coordinate;
    anno.type = kAnnotationSuspend;//暂停点类型
    [self.mapView addAnnotation:anno];
}
- (IBAction)end:(id)sender {
    //停止定位
    [self.locationManager stopUpdatingLocation];
    //在当前点添加一个停止的标注
    QYAnnotaion *anno = [[QYAnnotaion alloc] init];
    anno.coordinate = self.nowLocation.coordinate;
    anno.type = kAnnotationEnd;//停止点类型
    [self.mapView addAnnotation:anno];
}

#pragma mark - location delegate

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    //最有效的点
    CLLocation *location = locations.lastObject;
    NSLog(@"%@", location);
    
    if (!self.nowLocation) {
        //添加一个开始点的标记
        QYAnnotaion *begin = [[QYAnnotaion alloc] init];
        begin.coordinate = location.coordinate;//标注点的位置
        begin.type = kAnnotationStart;//标注的类型为开始
        [self.mapView addAnnotation:begin];
        
        //将地图的可显示区域移动到定位的区域,只在开始定位的时候设置
        BMKCoordinateRegion region;
        region.center = location.coordinate;
        BMKCoordinateSpan span;
        span.latitudeDelta = 0.005;
        span.longitudeDelta = 0.005;
        region.span = span;
        [self.mapView setRegion:region];
        
    }
    self.nowLocation = location;
    
    //添加当前点
    QYAnnotaion *now = [[QYAnnotaion alloc] init];
    now.coordinate = location.coordinate;
    now.type = kAnnotationNow;//标注的类型为当前位置
    [self.mapView addAnnotation:now];
    if (self.nowAnnotaion) {
        [self.mapView removeAnnotation:self.nowAnnotaion];
    }
    self.nowAnnotaion = now;

    if (!self.allLocations) {
        self.allLocations = [NSMutableArray array];
    }
    
    [self.allLocations addObject:location];
    //往地图上添加曲线覆盖层数据MKPolyline
    
    //初始化一个结构体数组在堆内存
    CLLocationCoordinate2D *coordinates = malloc(sizeof(CLLocationCoordinate2D) * self.allLocations.count);
    for (int i= 0; i < self.allLocations.count; i++) {
        coordinates[i] = [self.allLocations[i] coordinate];
    }
    //初始化一个曲线模型对象
    BMKPolyline *line = [BMKPolyline polylineWithCoordinates:coordinates count:self.allLocations.count];
    [self.mapView addOverlay:line];
    
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"%@", error);
}

#pragma mark - mapView delegate

-(BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation{
    if ([annotation isKindOfClass:[QYAnnotaion class]]) {
        //标注视图可以复用,
        static NSString *indentifier = @"qyAnnotaion";
        //从复用队列中出队
        BMKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:indentifier];
        if (!view) {
            view = [[BMKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:indentifier];
        }
        //绑定视图的数据
        view.annotation = annotation;
        QYAnnotaion *anno = (QYAnnotaion *)annotation;
        //设置显示的内容
        switch (anno.type) {
            case kAnnotationStart:
            {
                view.image = [UIImage imageNamed:@"map_start_icon"];
                view.centerOffset = CGPointMake(0, -12);
            }
                break;
            case kAnnotationNow:
            {
                view.image = [UIImage imageNamed:@"currentlocation"];
                view.centerOffset = CGPointMake(0, 0);
            }
                break;
            case kAnnotationSuspend:
            {
                view.image = [UIImage imageNamed:@"map_susoend_icon"];
                view.centerOffset = CGPointMake(0, -12);
            }
                break;
            case kAnnotationEnd:
            {
                view.image = [UIImage imageNamed:@"map_stop_icon"];
                view.centerOffset = CGPointMake(0, -12);
            }
                break;
                
            default:
                break;
        }
        
        
        return view;
    }
    return nil;
}

-(BMKOverlayView *)mapView:(BMKMapView *)mapView viewForOverlay:(id<BMKOverlay>)overlay{
    if ([overlay isKindOfClass:[BMKPolyline class]]) {
        BMKPolylineView *view = [[BMKPolylineView alloc] initWithPolyline:overlay];
        view.lineWidth = 2.f;
        view.strokeColor = [UIColor redColor];
        return view;
    }
    return nil;
}

////返回覆盖层渲染图层
//-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
//    if ([overlay isKindOfClass:[MKPolyline class]]) {
//        //曲线模型对应的渲染图层
//        MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithPolyline:overlay];
//        //配置线的属相
//        renderer.lineWidth = 3.f;
//        renderer.strokeColor = [UIColor blueColor];
//        return renderer;
//    }
//    return nil;
//}

@end
