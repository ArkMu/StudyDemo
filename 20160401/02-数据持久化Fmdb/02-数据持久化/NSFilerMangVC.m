//
//  NSFilerMangVC.m
//  02-数据持久化
//
//  Created by qingyun on 16/3/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "NSFilerMangVC.h"
#define Kname @"OC.txt"
#define kImage @"123.png"

@interface NSFilerMangVC ()
@property (weak, nonatomic) IBOutlet UITextField *txField;
@property(nonatomic,strong) NSString *filePath;
@property (weak, nonatomic) IBOutlet UIImageView *IconImage;
@property(nonatomic,strong) NSString *imagePath;
@end

@implementation NSFilerMangVC

-(NSString *)filePath{
    if (_filePath) {
        return _filePath;
    }
  //1.获取library目录
    NSString *libraryPath=NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
  //2创建文件夹
      //2.1 NSFileManager
      NSFileManager *fileManager=[NSFileManager defaultManager];
      //2.2 执行创建文件夹
    NSString *directoryPath=[libraryPath stringByAppendingPathComponent:@"file"];
    
    NSError *error;
    if (![fileManager createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:&error]) {
        NSLog(@"=====%@",error);
        return nil;
    }
   //3.创建文件
     //3.1 合并文件路径
    _filePath=[directoryPath stringByAppendingPathComponent:Kname];
    
     //3.1.1 判断文件是否存在
    if ([fileManager fileExistsAtPath:_filePath]) {
        NSLog(@"文件已经存在");
        return _filePath;
    }
     //3.2 创建文件
    BOOL result=[fileManager createFileAtPath:_filePath contents:nil attributes:nil];
    if (!result) {
        NSLog(@"创建失败");
        _filePath=nil;
        return _filePath;
    }

    return _filePath;
}

//存储图片的路径
/**
 *  imagePath
 *
 *  @param dirName   目录名称
 *  @param imageName 存储文件的名称
 *
 *  @return 存储文件的路径
 */
-(NSString *)imagePath:(NSString *)dirName imageName:(NSString *)imageName
{
 //1.library目录
    NSString *libPath=NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
 //2.创建文件夹
    NSString *dirPath=[libPath stringByAppendingPathComponent:dirName];
    //获取文件管理对象
    NSFileManager *manager=[NSFileManager defaultManager];
    NSError *error;
    if (![manager createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:0 error:&error]) {
        NSLog(@"%@===error",error);
        return nil;
    }
 //3.创建文件
    //3.1合并文件路径
    NSString *filePath=[dirPath stringByAppendingPathComponent:imageName];
    
    return filePath;
}

//从本地加载
-(void)loadData{
//1.从本地读取文件转换成string
    NSString *content=[[NSString alloc] initWithContentsOfFile:self.filePath encoding:NSUTF8StringEncoding error:nil];
    if (content) {
     //将内容赋值给ui
        _txField.text=content;
    }
 //读取本地图片
    UIImage *image=[UIImage imageWithContentsOfFile:[self imagePath:@"image" imageName:kImage]];
    
    _IconImage.image=image;
    
    
}

//保存
-(BOOL)saveFile{
   //1.获取要保存的字符串
    NSString *content=_txField.text;
    
    //2.保存string
    BOOL fileResult=[content writeToFile:self.filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    //3.保存图片
    //获取图片
    UIImage *iconImage=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1" ofType:@"png"]];
    NSData *data=UIImagePNGRepresentation(iconImage);
    
    BOOL imageResult= [data writeToFile:[self imagePath:@"image" imageName:kImage] atomically:YES];
    return imageResult&&fileResult;
}







- (IBAction)touchSave:(id)sender {
    if ([self saveFile]) {
        NSLog(@"=======保存成功");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载本地数据
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
