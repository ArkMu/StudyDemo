//
//  ViewController.m
//  MapDemo
//
//  Created by qingyun on 16/4/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController ()<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //设置地图的类型
//    self.mapView.mapType = MKMapTypeSatellite;
    
    //设置地图的区域
    //有一个中心点构成
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(34.785306f, 113.675523f);
    //区域的跨度
    MKCoordinateSpan span = MKCoordinateSpanMake(0.05, 0.05);
    //区域
    MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, span);
    
    [self.mapView setRegion:region];
    //响应地图的回调delegate
    self.mapView.delegate = self;
}

#pragma mark - mapView delegate

//改变区域开始
-(void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated{
    NSLog(@"will:%f,%f", mapView.region.center.latitude, mapView.region.center.longitude);
}
//改变区域结束
-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    NSLog(@"did:%f,%f", mapView.region.center.latitude, mapView.region.center.longitude);
}

@end
