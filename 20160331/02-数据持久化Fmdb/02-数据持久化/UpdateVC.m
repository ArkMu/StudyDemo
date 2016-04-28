//
//  UpdateVC.m
//  02-数据持久化
//
//  Created by qingyun on 16/3/31.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "UpdateVC.h"
#import "MangaDB.h"
#import "QYstudent.h"

@interface UpdateVC ()
@property (weak, nonatomic) IBOutlet UITextField *tfID;

@property (weak, nonatomic) IBOutlet UITextField *tfName;
@property (weak, nonatomic) IBOutlet UITextField *tfAge;
@property (weak, nonatomic) IBOutlet UITextField *tfPhone;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;


@end

@implementation UpdateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)insertIntoAction:(id)sender {
    //1.给mode赋值
    NSDictionary *vDic=@{@"name":_tfName.text,@"age":@(_tfAge.text.integerValue),@"phone":_tfPhone.text,@"data":UIImagePNGRepresentation(_iconImage.image),@"ID":@(_tfID.text.integerValue)};
    //Kvc
    QYstudent *student=[QYstudent setStudentDic:vDic];
    
    //2执行插入操作
    MangaDB *maga=[MangaDB shareDB];
    if ([maga UpdatefromStudent:student]) {
        NSLog(@"====update ok");
    }
    
    
    
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
