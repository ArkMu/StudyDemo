//
//  NSuserDefaultVC.m
//  02-数据持久化
//
//  Created by qingyun on 16/3/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "NSuserDefaultVC.h"

@interface NSuserDefaultVC ()
@property (weak, nonatomic) IBOutlet UITextField *tfName;
@property (weak, nonatomic) IBOutlet UITextField *tfAge;
@property (weak, nonatomic) IBOutlet UISwitch *sexSwitch;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@end

@implementation NSuserDefaultVC

//加载本地数据
-(void )loadLoaclData{
   //1.获取userdefaults的单例对象
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
   //2.geting values 获取设置的默认值
    _tfName.text=[defaults objectForKey:@"name"];
    
   // NSInteger age=[defaults integerForKey:@"age"];
   // _tfAge.text=[NSString stringWithFormat:@"%ld",age];
    _tfAge.text=[[defaults objectForKey:@"age"] stringValue];
    
    _sexSwitch.on=[defaults boolForKey:@"sex"];
    
    NSData *iconData=[defaults dataForKey:@"icon"];
    _iconImage.image=[UIImage imageWithData:iconData];
    
}

//保存数据到本地
-(void)saveData{
  //1.获取userdefaults的单例对象
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
  
    //2.seting values 给对象设置值
    [defaults setObject:_tfName.text forKey:@"name"];
    [defaults setInteger:_tfAge.text.integerValue forKey:@"age"];
    [defaults setBool:_sexSwitch.on forKey:@"sex"];
    NSData *iconData=UIImagePNGRepresentation([UIImage imageNamed:@"1"]);
    [defaults setObject:iconData forKey:@"icon"];
    NSDate *date=[NSDate date];
    [defaults setObject:date forKey:@"time"];
  
    //同步到本地
    [defaults synchronize];
}

- (IBAction)touchDown:(id)sender {
    [self saveData];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadLoaclData];
    
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
