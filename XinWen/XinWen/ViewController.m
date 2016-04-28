//
//  ViewController.m
//  XinWen
//
//  Created by qingyun on 16/4/18.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
//    cid	12663
//    pn	1
//    ctype	4010
//    selids
//    userID	0
//    udid	0
//    clientApp	104
//    clientBundleID	net.xinhuamm.mainclient
//    clientType	2
//    clientVer	3.0.0
//    clientMarket	198
//    clientOS	4.1.2
//    clientModel	LT26ii
//    clientNet	wifi
//    clientToken	4061b34703d54f69141abb7de021c2c9
//    clientId	4061b34703d54f69141abb7de021c2c9
//    clientLable	353617055672400
//    clientDev	0
//    clientPrison	0
//    clientWidth	720
//    clientHeight	1280
//    clientLongitude	113.564271
//    clientLatitude	34.81923
//    clientDate	1460973534668
//    province	河南省
//    address	河南省郑州市中原区迎春街靠近君荷酒店(高新区店)
    
//    NSDictionary *parameter = @{@"cid":@"12663",
//                                @"pn":@"1",
//                                @"ctype":@"4010",
//                                @"selids":@"",
//                                @"userID":@"0",
//                                @"udid":@"0",
//                                @"clientApp":@"104",
//                                @"clientBundleID":@"net.xinhuamm.mainclient",
//                                @"clientType":@"2",
//                                @"clientVer":@"3.0.0",
//                                @"clientMarket":@"198",
//                                @"clientOS":@"4.1.2",
//                                @"clientModel":@"LT26ii",
//                                @"clientNet":@"wifi",
//                                @"clientToken":@"4061b34703d54f69141abb7de021c2c9",
//                                @"clientId":@"4061b34703d54f69141abb7de021c2c9",
//                                @"clientLable":@"353617055672400",
//                                @"clientDev":@"0",
//                                @"clientPrison":@"0",
//                                @"clientWidth":@"720",
//                                @"clientHeight":@"1280",
//                                @"clientLongitude":@"113.564271",
//                                @"clientLatitude":@"34.81923",
//                                @"clientDate":@"1460973534668",
//                                @"province":@"河南省",
//                                @"address":@"河南省郑州市中原区迎春街靠近君荷酒店(高新区店)"};
    
//    [manager POST:@"http://xhpfm.mobile.zhongguowangshi.com:8091/v210/indexlist" parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@", responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@", error);
//    }];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
//    NSDictionary *parameter = @{@"did":@"353617055672400",
//                                @"pid":@"205",
//                                @"ver":@"100/61/2016020901",
//                                @"key":@"91d84b8a1ab48e519f931617f45fcaa0",
//                                @"Host":@"m.mapps.m1905.cn",
//                                @"User-Agent":@"Dalvik/1.6.0 (Linux; U; Android 4.1.2; LT26ii Build/6.2.B.1.96)",
//                                @"Connection":@"Keep-Alive",
//                                @"Accept-Encoding":@"gzip",
//                                @"uid":@"",
//                                @"sid":@""
//                                };
//    
//    [manager POST:@"http://m.mapps.m1905.cn/Recommendindex/home?mtype=1" parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@", responseObject);
//        NSLog(@"%@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@", error);
//    }];
    
    [manager GET:@"http://api.wallstreetcn.com/v2/mobile-articles?limit=5&page=1&channel=global-carousel&device=android&version=3&_eva_t=1460976264" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        id obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *resultDict = (NSDictionary *)obj;
        
        NSLog(@"%@", responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

@end
