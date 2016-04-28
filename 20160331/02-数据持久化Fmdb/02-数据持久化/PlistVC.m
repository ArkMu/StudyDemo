//
//  PlistVC.m
//  02-数据持久化
//
//  Created by qingyun on 16/3/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "PlistVC.h"
#define Kname @"PersonInfo.plist"


@interface PlistVC ()
@property (weak, nonatomic) IBOutlet UITextField *tfName;
@property (weak, nonatomic) IBOutlet UITextField *tfAge;
@property (weak, nonatomic) IBOutlet UISwitch *sexSwitch;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property(nonatomic,strong) NSString *filePath;
@end

@implementation PlistVC



-(NSString *)filePath{
    if (_filePath) {
        return _filePath;
    }
   //1.获取library目录
    NSString *libraryPath=NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
    //2.合并文件路径
    _filePath=[libraryPath stringByAppendingPathComponent:Kname];
    return _filePath;
}

//从本地加载数据
-(void)loadData{
   //取plist文件
    NSDictionary *dic=[[NSDictionary alloc] initWithContentsOfFile:self.filePath];
    if (dic) {
        _tfName.text=dic[@"name"];
        _tfAge.text=[dic[@"age"] stringValue];
        _sexSwitch.on=[dic[@"sex"] boolValue];
        NSData *data=dic[@"icon"];
        _iconImage.image=[UIImage imageWithData:data];
    
    }
}

//保存数据
-(BOOL)saveData{
   //获取数据存放在字典里
    NSMutableDictionary *vDic=[NSMutableDictionary dictionary];
    [vDic setObject:_tfName.text forKey:@"name"];
    [vDic setObject:@(_tfAge.text.integerValue) forKey:@"age"];
    [vDic setObject:@(_sexSwitch.on) forKey:@"sex"];
    NSData *data=UIImagePNGRepresentation([UIImage imageNamed:@"1"]);
    [vDic setObject:data forKey:@"icon"];
    NSDate *date=[NSDate date];
    [vDic setObject:date forKey:@"time"];
  //存在本地以plist
    return   [vDic writeToFile:self.filePath atomically:YES];
}


- (IBAction)touchDown:(id)sender {
    if ([self saveData]) {
        NSLog(@"====save ok!");
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    
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
