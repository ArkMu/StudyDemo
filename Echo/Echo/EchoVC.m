//
//  EchoVC.m
//  Echo
//
//  Created by qingyun on 16/4/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "EchoVC.h"

#import "Common.h"

#import "AFHTTPSessionManager.h"

#import "MJRefresh.h"

#import "ScrollCell.h"
#import "ScrollModel.h"

#import "ItemModel.h"
#import "ItemCell.h"

#import "DetailVC.h"

@interface EchoVC () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *scrollArr;

@property (nonatomic, strong) NSMutableArray *itemArr;

@property (nonatomic, assign) NSInteger pageIndex;

@end

@implementation EchoVC

static NSString *scrollIdentifier = @"scroll";
static NSString *itemIdemtifier = @"item";

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _pageIndex = 1;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
//    self.view.backgroundColor = [UIColor whiteColor];
    
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ScrollCell class]) bundle:nil] forCellWithReuseIdentifier:scrollIdentifier];
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ItemCell class]) bundle:nil] forCellWithReuseIdentifier:itemIdemtifier];
    
    _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        _pageIndex = 1;
        [self loadData];
    }];
    
    _collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        _pageIndex++;
        [self loadMoreData];
    }];
    
    _itemArr = [NSMutableArray array];
    
    [_collectionView.mj_header beginRefreshing];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (void)loadData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //    x-uuid	00000000-5666-7249-ffff-ffffc8a1b95d
    //    Cookie	PHPSESSID=3kna3813tpecttjen3381604k2; expires=Tue, 10-May-2016 06:53:42 GMT; Max-Age=2592000; path=/; domain=.kibey.com; HttpOnly
    //    x-av	9
    //    x-dt	00000000-5666-7249-ffff-ffffc8a1b95d
    //    x-c	2
    //    x-net	WIFI
    //    x-v	100
    //    User-Agent	Android 4.1.2,Sony Ericsson LT26ii,00000000-5666-7249-ffff-ffffc8a1b95d,5.1,100,353617055672400
    //    x-a-sn	f89639fe2a3a47c05af8762d4e2fbac0d8cf13e9
    //    x-sn	5e600e6dae68c83ada3655801fb8e936d39ae131/1460865278
    //    x-vs	5.1
    //    Host	echosystem.kibey.com
    //    Connection	Keep-Alive
    //    Accept-Encoding	gzip
    
    
//    x-uuid	00000000-5666-7249-ffff-ffffc8a1b95d
//    Cookie	PHPSESSID=3kna3813tpecttjen3381604k2; expires=Tue, 10-May-2016 06:53:42 GMT; Max-Age=2592000; path=/; domain=.kibey.com; HttpOnly
//    x-av	9
//    x-dt	00000000-5666-7249-ffff-ffffc8a1b95d
//    x-c	2
//    x-net	WIFI
//    x-v	100
//    User-Agent	Android 4.1.2,Sony Ericsson LT26ii,00000000-5666-7249-ffff-ffffc8a1b95d,5.1,100,353617055672400
//    x-a-sn	b76b0824627b5b75dee9c82c05ab71bb4abba8eb
//    x-sn	a1a6d59db8b7204cf364832dfc5db2055bd7e5a5/1460875159
//    x-vs	5.1
//    Host	echosystem.kibey.com
//    Connection	Keep-Alive
//    Accept-Encoding	gzip
    
    [manager.requestSerializer setValue:@"00000000-5666-7249-ffff-ffffc8a1b95d" forHTTPHeaderField:@"x-uuid"];
    [manager.requestSerializer setValue:@"PHPSESSID=3kna3813tpecttjen3381604k2; expires=Tue, 10-May-2016 06:53:42 GMT; Max-Age=2592000; path=/; domain=.kibey.com; HttpOnly" forHTTPHeaderField:@"Cookie"];
    [manager.requestSerializer setValue:@"9" forHTTPHeaderField:@"x-av"];
    [manager.requestSerializer setValue:@"00000000-5666-7249-ffff-ffffc8a1b95d" forHTTPHeaderField:@"x-dt"];
    [manager.requestSerializer setValue:@"2" forHTTPHeaderField:@"x-c"];
    [manager.requestSerializer setValue:@"WIFI" forHTTPHeaderField:@"x-net"];
    [manager.requestSerializer setValue:@"100" forHTTPHeaderField:@"x-v"];
    [manager.requestSerializer setValue:@"Android 4.1.2,Sony Ericsson LT26ii,00000000-5666-7249-ffff-ffffc8a1b95d,5.1,100,353617055672400" forHTTPHeaderField:@"User-Agent"];
    [manager.requestSerializer setValue:@"b76b0824627b5b75dee9c82c05ab71bb4abba8eb" forHTTPHeaderField:@"x-a-sn"];
    [manager.requestSerializer setValue:@"a1a6d59db8b7204cf364832dfc5db2055bd7e5a5/1460875159" forHTTPHeaderField:@"x-sn"];
    [manager.requestSerializer setValue:@"5.1" forHTTPHeaderField:@"x-vs"];
    [manager.requestSerializer setValue:@"echosystem.kibey.com" forHTTPHeaderField:@"Host"];
    [manager.requestSerializer setValue:@"Keep-Alive" forHTTPHeaderField:@"Connection"];
    [manager.requestSerializer setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
    
    [manager GET:@"http://echosystem.kibey.com/index/banner?android_v=100&app_channel=_360&position=0&t=1460875159796&v=9" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSArray *resultArr = resultDict[@"result"];
        
        _scrollArr = [NSMutableArray arrayWithCapacity:resultArr.count];
        
        for (NSDictionary *dict in resultArr) {
            ScrollModel *model = [ScrollModel modelWithDictionary:dict];
            [_scrollArr addObject:model];
        }
        
//        [resultArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            NSDictionary *dict = (NSDictionary *)obj;
//            ScrollModel *model = [ScrollModel modelWithDictionary:dict];
//            [_scrollArr addObject:model];
//        }];
        
//        [_collectionView reloadData];
        if ([_collectionView.mj_header isRefreshing]) {
            [_collectionView.mj_header endRefreshing];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
    if ([_collectionView.mj_header isRefreshing]) {
        if ([_itemArr count]) {
            [_itemArr removeAllObjects];
        }
    }
    [self loadMoreData];
}


- (void)loadMoreData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
//    x-uuid	00000000-5666-7249-ffff-ffffc8a1b95d
//    Cookie	PHPSESSID=3kna3813tpecttjen3381604k2; expires=Tue, 10-May-2016 06:53:42 GMT; Max-Age=2592000; path=/; domain=.kibey.com; HttpOnly
//    x-av	9
//    x-dt	00000000-5666-7249-ffff-ffffc8a1b95d
//    x-c	2
//    x-net	WIFI
//    x-v	100
//    User-Agent	Android 4.1.2,Sony Ericsson LT26ii,00000000-5666-7249-ffff-ffffc8a1b95d,5.1,100,353617055672400
//    x-a-sn	6827e2b2aec5bb798357f7aa2b336b944c907b90
//    x-sn	db2df904df8d06e162b3ff40a219170a471aada2/1460877502
//    x-vs	5.1
//    Host	echosystem.kibey.com
//    Connection	Keep-Alive
//    Accept-Encoding	gzip
    
    [manager.requestSerializer setValue:@"00000000-5666-7249-ffff-ffffc8a1b95d" forHTTPHeaderField:@"x-uuid"];
    [manager.requestSerializer setValue:@"PHPSESSID=3kna3813tpecttjen3381604k2; expires=Tue, 10-May-2016 06:53:42 GMT; Max-Age=2592000; path=/; domain=.kibey.com; HttpOnly" forHTTPHeaderField:@"Cookie"];
    [manager.requestSerializer setValue:@"9" forHTTPHeaderField:@"x-av"];
    [manager.requestSerializer setValue:@"00000000-5666-7249-ffff-ffffc8a1b95d" forHTTPHeaderField:@"x-dt"];
    [manager.requestSerializer setValue:@"2" forHTTPHeaderField:@"x-c"];
    [manager.requestSerializer setValue:@"WIFI" forHTTPHeaderField:@"x-net"];
    [manager.requestSerializer setValue:@"100" forHTTPHeaderField:@"x-v"];
    [manager.requestSerializer setValue:@"Android 4.1.2,Sony Ericsson LT26ii,00000000-5666-7249-ffff-ffffc8a1b95d,5.1,100,353617055672400" forHTTPHeaderField:@"User-Agent"];
    [manager.requestSerializer setValue:@"6827e2b2aec5bb798357f7aa2b336b944c907b90" forHTTPHeaderField:@"x-a-sn"];
    [manager.requestSerializer setValue:@"db2df904df8d06e162b3ff40a219170a471aada2/1460877502" forHTTPHeaderField:@"x-sn"];
    [manager.requestSerializer setValue:@"5.1" forHTTPHeaderField:@"x-vs"];
    [manager.requestSerializer setValue:@"echosystem.kibey.com" forHTTPHeaderField:@"Host"];
    [manager.requestSerializer setValue:@"Keep-Alive" forHTTPHeaderField:@"Connection"];
    [manager.requestSerializer setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
    
    if (_pageIndex == 1) {
        [manager.requestSerializer setValue:@"6827e2b2aec5bb798357f7aa2b336b944c907b90" forHTTPHeaderField:@"x-a-sn"];
        [manager.requestSerializer setValue:@"db2df904df8d06e162b3ff40a219170a471aada2/1460877502" forHTTPHeaderField:@"x-sn"];
    }
    if (_pageIndex == 2) {
        [manager.requestSerializer setValue:@"6e52a601ecb2a1d920e775c0a12600724d47f30f" forHTTPHeaderField:@"x-a-sn"];
        [manager.requestSerializer setValue:@"0887b4f8c359ee4daf6d2694944cd26eff22fe9b/1460879739" forHTTPHeaderField:@"x-sn"];
    }
    if (_pageIndex == 3) {
        [manager.requestSerializer setValue:@"7eb5944078c601657846c364815928d6547e9bad" forHTTPHeaderField:@"x-a-sn"];
        [manager.requestSerializer setValue:@"9da0d459012b38bf32a9f1ab4fd8437f48f61aca/1460881168" forHTTPHeaderField:@"x-sn"];
    }
    if (_pageIndex == 4) {
        [manager.requestSerializer setValue:@"15c7fa1a6c77d8ae30192041640c0783f27f1b04" forHTTPHeaderField:@"x-a-sn"];
        [manager.requestSerializer setValue:@"296236d5a9eb869c281204a931e27fb067d23485/1460881410" forHTTPHeaderField:@"x-sn"];
    }
    
    
    NSString *urlStr = @"";
    if (_pageIndex == 1) {
        urlStr = @"http://echosystem.kibey.com/sound/hot?android_v=100&app_channel=_360&last_rec_id=&t=1460877502833&v=9";
    } else if (_pageIndex == 2) {
//        urlStr = @"http://echosystem.kibey.com/sound/hot?android_v=100&app_channel=_360&last_rec_id=1000021033&t=1460877502833&v=9";
        urlStr = @"http://echosystem.kibey.com/sound/hot?android_v=100&app_channel=_360&last_rec_id=1000021033&t=1460879739703&v=9";
    } else if (_pageIndex == 3) {
        urlStr = @"http://echosystem.kibey.com/sound/hot?android_v=100&app_channel=_360&last_rec_id=1000021024&t=1460881168272&v=9";
    } else {
        urlStr = @"http://echosystem.kibey.com/sound/hot?android_v=100&app_channel=_360&last_rec_id=1000021014&t=1460881410967&v=9";
    }
    
    NSDictionary *parametetr = @{@"page":@(_pageIndex)};
    
    [manager GET:urlStr parameters:parametetr progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSArray *resultArr = resultDict[@"result"][@"data"];
        
        
        for (NSDictionary *dict in resultArr) {
            ItemModel *model = [ItemModel modelWithDictioanry:dict];
            [_itemArr addObject:model];
        }
        
        [_collectionView reloadData];
        if ([_collectionView.mj_footer isRefreshing]) {
            if (_pageIndex == 4) {
                [_collectionView.mj_footer endRefreshingWithNoMoreData];
            } else {
                [_collectionView.mj_footer endRefreshing];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    
    return _itemArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        ScrollCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:scrollIdentifier forIndexPath:indexPath];
        cell.mArr = _scrollArr;
        return cell;
    }
    
    ItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:itemIdemtifier forIndexPath:indexPath];
    cell.itemModel = _itemArr[indexPath.item];
    return cell;
    
}

#pragma mark - UICollectionFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeMake(ScreenW, 160);
    }
    return CGSizeMake(ScreenW / 2 - 10, 200);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ItemModel *model = _itemArr[indexPath.item];
    
    DetailVC *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailVC"];
    
    detail.obj_id = [model.obj_id integerValue];
    
    [self.navigationController pushViewController:detail animated:NO];
}

@end
