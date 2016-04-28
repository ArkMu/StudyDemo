//
//  ViewController.m
//  02-数据持久化
//
//  Created by qingyun on 16/3/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "RootViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray *dataArr;
@property(nonatomic,strong)NSArray *dataClass;

@end

@implementation ViewController



- (void)viewDidLoad {
    self.title=@"数据持久化";
    _dataArr=@[@"oc 文件读写",@"Plist 文件读写",@"userDefaults 读写",@"归档解档"];
  _dataClass=@[@"NSFilerMangVC",@"PlistVC",@"NSuserDefaultVC",@"ArchAndUnArcVC"];
    [super viewDidLoad];
    UITableView *myTable=[[UITableView alloc] initWithFrame:self.view.frame];
    myTable.delegate=self;
    myTable.dataSource=self;
    [self.view addSubview:myTable];
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     static NSString *identifier=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text=_dataArr[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   //选中跳转下个页面
     Class class=NSClassFromString(_dataClass[indexPath.row]);
     RootViewController *controller=(RootViewController *)[[class alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
