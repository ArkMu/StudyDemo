//
//  ArchAndUnArcVC.m
//  02-数据持久化
//
//  Created by qingyun on 16/3/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ArchAndUnArcVC.h"
#import "QYmode.h"
#define KFName @"ARCH"
@interface ArchAndUnArcVC ()
@property (weak, nonatomic) IBOutlet UITextField *tfName;
@property (weak, nonatomic) IBOutlet UITextField *tfAge;
@property (weak, nonatomic) IBOutlet UISwitch *sexSwitch;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property(nonatomic,strong) NSString *filePath;
@end

@implementation ArchAndUnArcVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)filePath{
    if (_filePath) {
        return _filePath;
    }
  //1.library 路径
    NSString *libraryPath=NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
    
   //2合并文件路径
    _filePath=[libraryPath stringByAppendingPathComponent:KFName];
    
    return _filePath;
}

//从本地读取数据
-(void)loadData{
  //解档
    QYmode *mode=[NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
    if (mode) {
        _tfName.text=mode.name;
        _tfAge.text=[NSString stringWithFormat:@"%ld",mode.age];
        _sexSwitch.on=mode.isSex;
        _iconImage.image=[UIImage imageWithData:mode.iconData];
    }
    

}
//将数据存储在本地
-(BOOL)saveData{
   //1.初始化mode
    QYmode *mode=[[QYmode alloc] init];
    mode.name=_tfName.text;
    mode.age=_tfAge.text.integerValue;
    mode.isSex=_sexSwitch.on;
    mode.iconData=UIImagePNGRepresentation([UIImage imageNamed:@"1"]);
   //mode 归档====>nsdata[NSKeyedArchiver archivedDataWithRootObject:<#(nonnull id)#>]
   return  [NSKeyedArchiver archiveRootObject:mode toFile:self.filePath];

}

- (IBAction)touchSaver:(id)sender {
    [self saveData];
    
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
