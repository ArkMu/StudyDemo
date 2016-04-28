
//
//  DetailVC.m
//  Echo
//
//  Created by qingyun on 16/4/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "DetailVC.h"

#import "AFHTTPSessionManager.h"

#import <AVFoundation/AVFoundation.h>

#import "DetailModel.h"

#define kName @"test.m4a"

@interface DetailVC () <UITableViewDataSource, UITableViewDelegate, AVAudioPlayerDelegate>

@property (nonatomic, strong) DetailModel *detailModel;

@property (nonatomic, strong) UITableView *tableView;

//@property (nonatomic, strong) AVPlayer *player;

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@property (nonatomic, strong) NSString *filePath;

@end

@implementation DetailVC

static NSString *cellIdentifier = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (AVAudioPlayer *)audioPlayer {
    if (_audioPlayer) {
        return _audioPlayer;
    }
    
    NSError *error;
    
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:_filePath] error:&error];
    
    [_audioPlayer prepareToPlay];
    
    return _audioPlayer;
}

- (void)loadData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager.requestSerializer setValue:@"00000000-5666-7249-ffff-ffffc8a1b95d" forHTTPHeaderField:@"x-uuid"];
    [manager.requestSerializer setValue:@"PHPSESSID=3kna3813tpecttjen3381604k2; expires=Tue, 10-May-2016 06:53:42 GMT; Max-Age=2592000; path=/; domain=.kibey.com; HttpOnly" forHTTPHeaderField:@"Cookie"];
    [manager.requestSerializer setValue:@"9" forHTTPHeaderField:@"x-av"];
    [manager.requestSerializer setValue:@"00000000-5666-7249-ffff-ffffc8a1b95d" forHTTPHeaderField:@"x-dt"];
    [manager.requestSerializer setValue:@"2" forHTTPHeaderField:@"x-c"];
    [manager.requestSerializer setValue:@"WIFI" forHTTPHeaderField:@"x-net"];
    [manager.requestSerializer setValue:@"100" forHTTPHeaderField:@"x-v"];
    [manager.requestSerializer setValue:@"Android 4.1.2,Sony Ericsson LT26ii,00000000-5666-7249-ffff-ffffc8a1b95d,5.1,100,353617055672400" forHTTPHeaderField:@"User-Agent"];
//    [manager.requestSerializer setValue:@"0c7adcf47dd4a6963ced6e48fbb9835c75319bd5" forHTTPHeaderField:@"x-a-sn"];
//    [manager.requestSerializer setValue:@"d34cf21667932d6a508cc2f87667f61e23a59cd0/1460890421" forHTTPHeaderField:@"x-sn"];
    
    // 小黄人
//    [manager.requestSerializer setValue:@"41fa5401b789e4b244b469ea82c195d43efc4e6b" forHTTPHeaderField:@"x-a-sn"];
//    [manager.requestSerializer setValue:@"46c7e2f5973a31585f037baafcfffbb163924e37/1460962561" forHTTPHeaderField:@"x-sn"];
    // 小黄人
    [manager.requestSerializer setValue:@"9a8927abfa25111342653736a383cccecdcf5527" forHTTPHeaderField:@"x-a-sn"];
    [manager.requestSerializer setValue:@"a9112e61a2092e137c845f9f0d5b552699cc8c3f/1460966063" forHTTPHeaderField:@"x-sn"];
    
    
//    [manager.requestSerializer setValue:@"71389851e2b815a6caa285587390985753187ddc" forHTTPHeaderField:@"x-a-sn"];
//    [manager.requestSerializer setValue:@"75869e6d1119b80dfa534390abef9be1bfe4cf22/1460947205" forHTTPHeaderField:@"x-sn"];
    
    [manager.requestSerializer setValue:@"5.1" forHTTPHeaderField:@"x-vs"];
    [manager.requestSerializer setValue:@"echosystem.kibey.com" forHTTPHeaderField:@"Host"];
    [manager.requestSerializer setValue:@"Keep-Alive" forHTTPHeaderField:@"Connection"];
    [manager.requestSerializer setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
    
//    NSDictionary *parameter = @{@"sound_id":@(391673)};
    NSDictionary *parmeter = @{@"sound_id":@(_obj_id)};
    
//    @"http://echosystem.kibey.com/sound/info?android_v=100&app_channel=_360&sound_id=1129422&t=1460890421635&v=9"
    
//    http://echosystem.kibey.com/bullet/get?android_v=100&app_channel=_360&limit=0&page=0&rand=0&sound_id=985612&t=1460946827892&time_part_no=1&type=1&v=9
    
//    http://echosystem.kibey.com/sound/info?android_v=100&app_channel=_360&sound_id=1161244&t=1460946986130&v=9
    
//    http://echosystem.kibey.com/sound/info?android_v=100&app_channel=_360&sound_id=1145104&t=1460947076165&v=9
    
    [manager GET:@"http://echosystem.kibey.com/sound/info?android_v=100&app_channel=_360&t=1460966063757&v=9" parameters:parmeter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@", responseObject);
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        _detailModel = [DetailModel modelWithDictionary:resultDict[@"result"]];
        
        [self loadMusic];
        [self loadTableView];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

- (void)loadTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.dataSource =  self;
    _tableView.delegate = self;
    _tableView.rowHeight = 100.f;
    
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  
    
    return cell;
    
}

- (void)loadMusic {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:_detailModel.source parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        
        NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        _filePath = [path stringByAppendingPathComponent:kName];
        
        [responseObject writeToFile:_filePath options:NSDataWritingAtomic error:nil];
        [self audioPlayer];
        [_audioPlayer play];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

@end
