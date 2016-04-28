//
//  ViewController.m
//  01-UISearchBarDemo
//
//  Created by qingyun on 16/3/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) NSDictionary *dict;
@property (nonatomic, strong) NSArray *keys;

@property (nonatomic, strong) NSMutableArray *results;

@property (nonatomic) BOOL isSearching;
@end

@implementation ViewController
static NSString *identifier = @"cell";
//加载数据
-(void)loadDictFromFile{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sortednames" ofType:@"plist"];
    _dict = [NSDictionary dictionaryWithContentsOfFile:path];
    _keys = [_dict.allKeys sortedArrayUsingSelector:@selector(compare:)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDictFromFile];
    
    //注册单元格
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    //设置searchBar的代理
    _searchBar.delegate = self;
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark  -UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (_isSearching) {
        return 1;
    }
    return _keys.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_isSearching) {
        return _results.count;
    }
    //取到当前section键
    NSString *key = _keys[section];
    //取到当前section对应的数组
    NSArray *array = _dict[key];
    return array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (_isSearching) {
        cell.textLabel.text = _results[indexPath.row];
    }else{
        //取到当前section键
        NSString *key = _keys[indexPath.section];
        //取到当前section对应的数组
        NSArray *array = _dict[key];
        
        cell.textLabel.text = array[indexPath.row];
    }
    return cell;
}

//section标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (_isSearching) {
        return nil;
    }
    return _keys[section];
}

//设置索引
-(NSArray <NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    if (_isSearching) {
        return nil;
    }
    return _keys;
}

#pragma mark  -UISearchBarDelegate
//开始编辑
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    //显示取消按钮
    searchBar.showsCancelButton = YES;
}

//点击取消按钮的时候
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    //隐藏取消按钮
    searchBar.showsCancelButton = NO;
    //取消searchBar的第一响应
    [searchBar resignFirstResponder];
    //清除searchBar的文本
    searchBar.text = nil;
    //更改搜索状态，并刷新界面
    _isSearching = NO;
    [_tableView reloadData];
}

//点击搜索按钮的时候
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    //取消searchBar的第一响应
    [searchBar resignFirstResponder];
    //隐藏取消按钮
    searchBar.showsCancelButton = NO;
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if (searchText.length == 0) {//显示原来的数据
        _isSearching = NO;
        [_tableView reloadData];
        return;
    }
    
    //更改搜索状态
    _isSearching = YES;
    //创建过滤谓词
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[CD] %@",searchText];
    NSMutableArray *resultArr = [NSMutableArray array];
    for (NSString *key in _keys) {
        NSArray *array = _dict[key];
        NSArray *rArray = [array filteredArrayUsingPredicate:predicate];
        [resultArr addObjectsFromArray:rArray];
    }
    _results = resultArr;
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
