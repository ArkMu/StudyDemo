//
//  SelectVC.m
//  02-数据持久化
//
//  Created by qingyun on 16/3/31.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "SelectVC.h"
#import "QYstudent.h"
#import "MangaDB.h"

@interface SelectVC ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *tfID;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (strong,nonatomic) NSMutableArray *dataArr;
@end

@implementation SelectVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)touchIDAction:(id)sender {
    _dataArr=[[MangaDB shareDB] selectStudentFromID:_tfID.text.intValue];
    if (_dataArr) {
        //刷新UI
        [_myTableView reloadData];
    }
}
- (IBAction)touchAllAction:(id)sender {
    _dataArr=[[MangaDB shareDB]selectAllStudent];
    if (_dataArr) {
        //刷新UI
        [_myTableView   reloadData];
    }
    
    
}

#pragma mark dataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    QYstudent *student=_dataArr[indexPath.row];
    cell.imageView.image=[UIImage imageWithData:student.data];
    cell.textLabel.text=[NSString stringWithFormat:@"ID:%ld       name:%@",student.ID,student.name];
    cell.detailTextLabel.text=[NSString stringWithFormat:@"age:%ld          phone:%@",student.age,student.phone];
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
