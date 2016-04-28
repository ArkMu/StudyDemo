//
//  ViewController.m
//  03-KvoDemo
//
//  Created by qingyun on 16/3/18.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYmode.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property(nonatomic,strong)QYmode *mode;
@end

@implementation ViewController

- (IBAction)changeAge:(id)sender {
    //改变mode.age的值
    
    _mode.age+=1;
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"age"]) {
        //1取出change  new值,更新ui
        UILabel *labe=(__bridge UILabel *)context;
        
        
        labe.text=[change[@"new"]stringValue];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.初始化mode
    _mode=[[QYmode alloc] init];
    _mode.name=@"张三";
    _mode.age=11;
   //2注册监听kvo 监听keypath age
   // [_mode addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:NULL];
    
    [_mode addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:(__bridge void *)_ageLabel];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)dealloc{
    //移除kvo监听
    [_mode removeObserver:self forKeyPath:@"age"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
