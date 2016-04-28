//
//  ViewController.m
//  04-WeiBo
//
//  Created by qingyun on 16/3/1.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYHomeViewController.h"
#import "QYStatus.h"
#import "QYStatusCell.h"
#import "QYStatusFooterView.h"
@interface QYHomeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, strong) NSArray *statusList;
@end

@implementation QYHomeViewController
static NSString *identifer = @"statusCell";
static NSString *footerIdentifer = @"statusFooter";
-(NSArray *)statusList{
    if (_statusList == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"temp" ofType:@"plist"];
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
        NSArray *status = dict[@"statuses"];
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dict in status) {
            QYStatus *st = [QYStatus statusWithDictionary:dict];
            [array addObject:st];
        }
        _statusList = array;
    }
    return _statusList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.statusList);
    //注册单元格
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QYStatusCell class]) bundle:nil] forCellReuseIdentifier:identifer];
    //注册section的尾
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QYStatusFooterView class]) bundle:nil] forHeaderFooterViewReuseIdentifier:footerIdentifer];
    
    
    _tableView.estimatedRowHeight = 140;
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark -UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.statusList.count;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QYStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer forIndexPath:indexPath];
    QYStatus *status = self.statusList[indexPath.section];
    cell.status = status;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.1;
    }
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 40;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    QYStatusFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:footerIdentifer];
    QYStatus *status = self.statusList[section];
    footerView.status = status;
    return footerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
