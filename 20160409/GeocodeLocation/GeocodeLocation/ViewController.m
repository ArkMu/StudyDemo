//
//  ViewController.m
//  GeocodeLocation
//
//  Created by qingyun on 16/4/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITextField *textFild;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self.mapView addGestureRecognizer:longPress];
    
}
- (IBAction)seach:(id)sender {
    [self.textFild resignFirstResponder];
//    将用户输入的信息,编码为地理位置信息
    NSString *str = self.textFild.text;
    
    //示例化一个编码器
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:str completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        NSLog(@"%@", placemarks);
        
        
        double minLatitude = 90.f;
        double maxLatitude = -90.f;
        double minLongtitude = 180.f;
        double maxLongtitude = -180.f;
        
        for (CLPlacemark *place in placemarks) {
            NSLog(@"%@", place.name);
            
            CLLocationCoordinate2D coordinate = place.location.coordinate;
            MKPointAnnotation *anno = [[MKPointAnnotation alloc] init];
            anno.coordinate = place.location.coordinate;
            anno.title = place.name;
            [self.mapView addAnnotation:anno];
            
            minLatitude = coordinate.latitude < minLatitude ? coordinate.latitude : minLatitude;
            maxLatitude = coordinate.latitude > maxLatitude ? coordinate.latitude : maxLatitude;
            minLongtitude = coordinate.longitude < minLongtitude ? coordinate.longitude : minLongtitude;
            maxLongtitude = coordinate.longitude > maxLongtitude ? coordinate.longitude : maxLongtitude;
        }
        //构造地图显示的range
        CLLocationCoordinate2D center;
        center.latitude = (minLatitude + maxLatitude)/2;
        center.longitude = (minLongtitude + maxLongtitude)/2;
        MKCoordinateSpan span;
        span.latitudeDelta = (maxLatitude - minLatitude) * 1.2;
        span.longitudeDelta = (maxLongtitude -minLongtitude) *1.2;
        MKCoordinateRegion region = MKCoordinateRegionMake(center, span);
        [self.mapView setRegion:region];
        
        
    }];
    
}

-(void)longPress:(UIGestureRecognizer *)press{
    //在视图坐标系中,找到手势响应的位置
    CGPoint point = [press locationInView:self.mapView];
    CLLocationCoordinate2D coordinate = [self.mapView convertPoint:point toCoordinateFromView:self.mapView];
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        MKPlacemark * _Nullable place = placemarks[0];
        
        MKPointAnnotation *anno = [[MKPointAnnotation alloc] init];
        anno.coordinate = place.location.coordinate;
        //编码的位置信息
        anno.title = place.name;
        [self.mapView addAnnotation:anno];
        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
