//
//  ViewController.m
//  01-RecoderPlayer
//
//  Created by qingyun on 16/4/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>


#define Kfile @"test.caf"

@interface ViewController ()<AVAudioRecorderDelegate>
//播放器对象
@property(nonatomic,strong)AVAudioPlayer *player;
//录音器对象
@property(nonatomic,strong)AVAudioRecorder *recorder;
//文件路径
@property(nonatomic,strong)NSURL *filePath;

@end

@implementation ViewController

-(NSURL *)filePath{
    if (_filePath) {
        return _filePath;
    }
    _filePath=[NSURL URLWithString:[@"/Users/qingyun/Desktop"stringByAppendingPathComponent:Kfile]];
    return _filePath;
}
//设置录音的音频格式
-(NSDictionary *)recorderConfig{
    NSMutableDictionary *setingDic=[NSMutableDictionary dictionary];
   //1.编码格式 pcm
    [setingDic setObject:@(kAudioFormatLinearPCM) forKey:AVFormatIDKey];
    //2.设置采样率
    [setingDic setObject:@(8000) forKey:AVSampleRateKey];
    //3.声道数量
    [setingDic setObject:@(2) forKey:AVNumberOfChannelsKey];
    //4.量化位数
    [setingDic setObject:@(8) forKey:AVLinearPCMBitDepthKey];
    //5.编码是否允许有浮点数
    [setingDic setObject:@(YES) forKey:AVLinearPCMIsFloatKey];
    
    //6.设置编码质量
    [setingDic setObject:@(AVAudioQualityHigh) forKey:AVEncoderAudioQualityKey];
    return setingDic;

}

//录音器对象
-(AVAudioRecorder *)recorder{
    if (_recorder) {
        return _recorder;
    }
   //初始化录音器对象
    _recorder=[[AVAudioRecorder alloc] initWithURL:self.filePath settings:[self recorderConfig] error:nil];
    //设置委托
    _recorder.delegate=self;
    
    //准备
    [_recorder prepareToRecord];
    
    return _recorder;
}
//播放器
-(AVAudioPlayer *)player{
    if (_player) {
        return _player;
    }
    _player=[[AVAudioPlayer alloc] initWithContentsOfURL:self.filePath error:nil];
    [_player prepareToPlay];
    return _player;
}


- (IBAction)startRecord:(UIButton *)sender {
    if(self.recorder.isRecording){
    //暂停
        [sender setTitle:@"开始录音" forState:UIControlStateNormal];
        [self.recorder pause];
    }else{
        [sender setTitle:@"暂停录音" forState:UIControlStateNormal];
        [self.recorder record];
    }
    
}
- (IBAction)touchEndRecord:(id)sender {
    [self.recorder stop];
    
}
- (IBAction)touchPlaye:(id)sender {
    if (self.player.isPlaying) {
        [self.player pause];
    }else{
    [self.player play];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
