//
//  ViewController.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/10/11.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>

@interface ViewController ()
@property (nonatomic, strong) UILabel *markLabel;
@property (nonatomic, weak) UIButton *submit;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController{

    NSInteger index;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    return;
    
    [self creatSubview];
    [self creatTimer];
    
}

- (void)creatSubview{

    //标签视图
    self.markLabel =[[UILabel alloc] init];
    self.markLabel.textAlignment =NSTextAlignmentCenter;
    self.markLabel.textColor = [UIColor greenColor];
    self.markLabel.textColor = [UIColor redColor];
    self.markLabel.font =[UIFont systemFontOfSize:40.0f];
    [self.view addSubview:self.markLabel];
    [self.markLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.height.mas_equalTo(360/2);
        make.width.mas_equalTo(720/2);
    }];
    
    
    UIButton *submit = [UIButton buttonWithType:UIButtonTypeCustom];
    self.submit = submit;
    submit.backgroundColor = RandomColor;
    [submit setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [submit setTitle:@"停止" forState:UIControlStateNormal];
    [submit addTarget:self action:@selector(beginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submit];
    [submit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.markLabel.mas_bottom).mas_offset(30);
        make.left.equalTo(self.markLabel);
        make.height.mas_equalTo(100/2);
        make.width.mas_equalTo(100/2);
    }];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.backgroundColor = RandomColor;
    [backBtn setTitle:@"开始" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.markLabel.mas_bottom).mas_offset(30);
        make.right.equalTo(self.markLabel);
        make.height.mas_equalTo(100/2);
        make.width.mas_equalTo(100/2);
    }];

    UIButton *bgBtn = [[UIButton alloc] init];
    [bgBtn addTarget:self action:@selector(donothing) forControlEvents:UIControlEventTouchUpInside];
    bgBtn.backgroundColor = RandomColor;
    [self.view  addSubview: bgBtn];
    [bgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backBtn.mas_bottom).mas_offset(30);
        make.right.equalTo(self.markLabel);
        make.height.mas_equalTo(100/2);
        make.width.mas_equalTo(100/2);
    }];
    
}

//计时器的方法
- (void)creatTimer{

    index = 100;
    //计时器
    self.timer=[NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(action) userInfo:nil repeats:YES];
    NSRunLoop *runloop=[NSRunLoop currentRunLoop];
    [runloop addTimer:self.timer forMode:NSDefaultRunLoopMode];
    
//    TimerInterval : 执行之前等待的时间。比如设置成1.0，就代表1秒后执行方法
//    target : 需要执行方法的对象。
//    selector : 需要执行的方法
//    repeats : 是否需要循环
//    释放方法
//    [timer invalidate];
}



- (void)action{

    index--;
    self.markLabel.text = [NSString stringWithFormat:@"倒计时%ld秒",index];
}


- (void)viewDidDisappear:(BOOL)animated{

    [self.timer invalidate];
}


- (void)beginAction{


    //停止定时器
    self.timer.fireDate = [NSDate distantFuture];

}

- (void)backAction{

    //启动定时器
    self.timer.fireDate = [NSDate distantPast];
}

- (void)donothing{

    MainViewController *main = [[MainViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:main];
    
    [self presentViewController:nav animated:YES completion:nil];
    
    
}

@end
