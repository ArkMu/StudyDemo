//
//  ViewController.m
//  04-MPmoviePlayerController
//
//  Created by qingyun on 16/4/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface ViewController ()
//必须在这里声明成全局的属性
@property(nonatomic,strong)MPMoviePlayerController *player;
@end

@implementation ViewController

-(void)notification:(NSNotification *)center{
    NSLog(@"=====%@",center);
    [_player.view removeFromSuperview];
}

-(void)addNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
}

- (IBAction)playe:(id)sender {
    //1.获取URL
     NSURL *url=[[NSBundle mainBundle] URLForResource:@"124" withExtension:@"m4v"];
#if 0

    //2.初始化视频播放器对象
    _player=[[MPMoviePlayerController alloc] initWithContentURL:url];
    //设置Frame
   _player.view.frame=self.view.frame;
    //设置控制面板
    _player.controlStyle=MPMovieControlStyleFullscreen;
    
    [self.view addSubview:_player.view];
    [_player play];
    
    //添加监听
    [self addNotification];
#endif  
    
    MPMoviePlayerViewController *mpMoviePlayer=[[MPMoviePlayerViewController alloc] initWithContentURL:url];
    mpMoviePlayer.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    [self presentViewController:mpMoviePlayer animated:YES completion:nil];
    
    
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
