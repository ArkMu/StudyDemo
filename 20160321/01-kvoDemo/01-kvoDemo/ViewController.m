//
//  ViewController.m
//  01-kvoDemo
//
//  Created by qingyun on 16/3/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYMode.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *tempView;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (strong,nonatomic) QYMode *mode;
//获取最大的Y
@property (assign,nonatomic)float maxY;
@end

@implementation ViewController


-(void)downGesture:(UISwipeGestureRecognizer *)gesture{
  //下滑
    if (self.mode.volue>100) {
        self.mode.volue-=100;
    }else{

        
    }
}

-(void)upgestureRecognizer:(UISwipeGestureRecognizer*)gesture{
 //上滑动
    if (self.mode.volue<400) {
        self.mode.volue+=100;
    }
    

}


- (void)viewDidLoad {
    [super viewDidLoad];
     //初始化数据模型
    _mode=[[QYMode alloc] init];
    _mode.volue=400;
    //kvo 监听volue属性
    [_mode addObserver:self forKeyPath:@"volue" options:NSKeyValueObservingOptionNew context:NULL];
    
    //创建手势上滑动
    UISwipeGestureRecognizer *swipeUp=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(upgestureRecognizer:)];
    swipeUp.direction=UISwipeGestureRecognizerDirectionUp;
    [self.tempView addGestureRecognizer:swipeUp];
    
    //创建下滑手势
    UISwipeGestureRecognizer *swipeDown=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(downGesture:)];
    swipeDown.direction=UISwipeGestureRecognizerDirectionDown;
    [self.tempView addGestureRecognizer:swipeDown];
    
    //获取最大的Y
    _maxY=CGRectGetMaxY(_tempView.frame);
    
    
    // Do any additional setup after loading the view, typically from a nib.
}






#pragma mark 监听回调方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
   //1.获取当前新值
    if ([keyPath isEqualToString:@"volue"]) {
        //获取到新值
        NSInteger newVolue=[change[NSKeyValueChangeNewKey] integerValue];
        //2.更新ui
        CGRect rect=_tempView.frame;
        rect.origin.y=_maxY - newVolue;
        rect.size.height=newVolue;
        _tempView.frame=rect;
        
        //更新label
        _tempLabel.text=[NSString stringWithFormat:@"血量:%ld",newVolue];
        
    }
    
    
    
    
   

}

-(void)dealloc{
//移除kvo
    [_mode removeObserver:self forKeyPath:@"volue"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
