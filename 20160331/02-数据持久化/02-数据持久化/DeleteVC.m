//
//  DeleteVC.m
//  02-数据持久化
//
//  Created by qingyun on 16/3/31.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "DeleteVC.h"
#import "MangaDB.h"
#import "QYstudent.h"
@interface DeleteVC ()
@property (weak, nonatomic) IBOutlet UITextField *removeID;

@end

@implementation DeleteVC
- (IBAction)deleteAction:(id)sender {
    //1.给mode赋值
//    NSDictionary *vDic=@{@"ID":@(_removeID.text.intValue)};
//    //Kvc
//    QYstudent *student=[QYstudent setStudentDic:vDic];
    
    //2执行插入操作
    MangaDB *maga=[MangaDB shareDB];
    if ([maga deleteFromStudent:_removeID.text.intValue]) {
        NSLog(@"====delete ok");
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
