//
//  ViewController.m
//  05-avaudioPlayer
//
//  Created by qingyun on 16/4/1.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>


@interface ViewController ()<AVAudioPlayerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;
@property (weak, nonatomic) IBOutlet UISlider *playSlider;
@property (weak, nonatomic) IBOutlet UIProgressView *meterProgress;
//声明播放器对象
@property (strong,nonatomic) AVAudioPlayer *player;

//计时器
@property(strong,nonatomic)NSTimer *timer;

@end

@implementation ViewController
//设置音频播放的会话模式
-(void)setSeesionCategory{
//1.获取当前会话
    AVAudioSession *session=[AVAudioSession sharedInstance];
//2.设置会话模式 后台播放的会话模式
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
 //3.启动会话
    [session setActive:YES error:nil];
}

//设置锁屏信息
-(void)nowPlayingInfo{
 //1.获取单例对象
    MPNowPlayingInfoCenter *mpNow=[MPNowPlayingInfoCenter defaultCenter];
    
    //设置锁屏背景图片
    MPMediaItemArtwork *artwork=[[MPMediaItemArtwork alloc] initWithImage:[UIImage imageNamed:@"1.png"]];
    
 //2.设置播放信息
    NSDictionary *nowInfo=@{MPMediaItemPropertyTitle:@"小葡萄",MPMediaItemPropertyPlaybackDuration:@(self.player.duration),MPMediaItemPropertyArtist:@"zhangsan",MPMediaItemPropertyArtwork:artwork};
    
    mpNow.nowPlayingInfo=nowInfo;

}


-(void)UpdateUI{
  //1.刷新播放进度
    _playSlider.value=self.player.currentTime;
  //2.刷新分贝UI
    //2.1更新分贝值
    [self.player updateMeters];
    //范围0- (-)160
    float peakPower=[self.player averagePowerForChannel:1];
   // NSLog(@"=====%f",peakPower);
    _meterProgress.progress=1-(peakPower/-160.0);
    
}


-(NSTimer *)timer{
    if (_timer) {
        return _timer;
    }
    _timer=[NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(UpdateUI) userInfo:nil repeats:YES];
    return _timer;
}

-(AVAudioPlayer *)player{
    if (_player) {
        return _player;
    }
   //.初始化Player
    NSError *error;
    _player=[[AVAudioPlayer alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"小葡萄" withExtension:@"mp3"] error:&error];
    if (error) {
        NSLog(@"===error====%@",error);
    }
    //设置速率可用
    _player.enableRate=YES;
    //设置代理
    _player.delegate=self;
    //设置分贝可用使用
    _player.meteringEnabled=YES;
    //初始化硬件准备
    [_player prepareToPlay];
    //调用后台播放策略
    [self setSeesionCategory];
    //设置锁屏信息
    [self nowPlayingInfo];
    return _player;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化音量范围
    _volumeSlider.maximumValue=1.0;
 
    //设置播放时间的最大值
    _playSlider.maximumValue=self.player.duration;
    //成为第一响应者
    [self becomeFirstResponder];

    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark 播放/暂停
- (IBAction)playORpause:(UIButton *)sender {
    if (self.player.isPlaying) {
      //暂停
        [self.player pause];
        [sender setTitle:@"播放" forState:UIControlStateNormal];
        //暂停
        self.timer.fireDate=[NSDate distantFuture];
    }else{
        [self.player play];
        [sender setTitle:@"暂停" forState:UIControlStateNormal];
        
        //播放
        self.timer.fireDate=[NSDate distantPast];
    }
}
#pragma mark 快退.5
- (IBAction)rateSlowAction:(UIButton *)sender {
    self.player.rate=.5;
}
#pragma mark 速率正常
- (IBAction)rateSetInit:(id)sender {
    self.player.rate=1;
}
#pragma mark 速率快进
- (IBAction)rateFast:(UIButton *)sender {
    self.player.rate=2;
}
#pragma mark 控制播放进度
- (IBAction)playCurrentTime:(UISlider *)sender {
    //设置当前播放的时间
    self.player.currentTime=sender.value;
}
#pragma mark 音量
- (IBAction)volumeChange:(UISlider *)sender {
    self.player.volume=sender.value;
}
#pragma mark delegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    if (flag) {
        NSLog(@"playing  finish");
    }
}

-(void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error{
    NSLog(@"解码失败=====%@",error);

}

-(BOOL)canBecomeFirstResponder{
    return YES;
}

#pragma mark 实现远程控制事件的方法
-(void)remoteControlReceivedWithEvent:(UIEvent *)event{
    NSLog(@"=======subtype=====%ld",event.subtype);
   }



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
