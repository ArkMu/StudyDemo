//
//  ViewController.m
//  01-播放系统音
//
//  Created by qingyun on 16/4/1.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>



@interface ViewController ()
//播放声音的对象
@property(nonatomic)SystemSoundID soundID;

@property(nonatomic)CFURLRef fileURl;
@end

@implementation ViewController
void soundFinshed(SystemSoundID snd,void *content){
   //移除对象
    AudioServicesRemoveSystemSoundCompletion(snd);
    //销毁对象
    AudioServicesDisposeSystemSoundID(snd);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//创建soundID
-(void)setSound_ID{
  //获取播放文件的路径
    NSURL *SourceUrl=[[NSBundle mainBundle] URLForResource:@"tap" withExtension:@"caf"];
    //桥接
    _fileURl=(__bridge CFURLRef)SourceUrl;
   //创建soundID对象,播放的对象
    AudioServicesCreateSystemSoundID(_fileURl, &_soundID);
    
    //注册播放完成后的通知
    AudioServicesAddSystemSoundCompletion(_soundID, NULL, NULL, soundFinshed, NULL);
    
}

#pragma mark 播放声音
- (IBAction)playSoundAction:(UIButton *)sender {
    [self setSound_ID];

    //播放一个声音
    AudioServicesPlaySystemSound(_soundID);
}
#pragma mark 播放警告音
- (IBAction)playAlterSoundAction:(UIButton *)sender {
    [self setSound_ID];                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    AudioServicesPlayAlertSound(_soundID);
}
#pragma mark 播放震动
- (IBAction)playeVibrateAction:(UIButton *)sender {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    
}

-(void)dealloc{
//    AudioServicesDisposeSystemSoundID(_soundID);
//    CFRelease(_fileURl);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
