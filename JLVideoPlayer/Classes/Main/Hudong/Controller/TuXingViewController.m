//
//  TuXingViewController.m
//  JLVideoPlayer
//
//  Created by UCS on 2017/4/27.
//  Copyright © 2017年 WangJiangliang. All rights reserved.
//

#import "TuXingViewController.h"
#import "CircleProgress.h"

#define ZZRGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface TuXingViewController ()

@end

@implementation TuXingViewController

//{
//    CircleProgress *circle1;
//    CircleProgress *circle2;
//    CircleProgress *circle3;
//    CircleProgress *circle4;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatSubview];
    
    
//    CGFloat xCrack = ([UIScreen mainScreen].bounds.size.width-150*2)/3.0;
//    CGFloat yCrack = ([UIScreen mainScreen].bounds.size.height-150*2)/3.0;
//    CGFloat itemWidth = 150;

    
//    //默认状态
//    circle1 = [[CircleProgress alloc] initWithFrame:CGRectMake(xCrack, yCrack, itemWidth, itemWidth) pathBackColor:nil pathFillColor:ZZRGB(arc4random()%255, arc4random()%255, arc4random()%255) startAngle:0 strokeWidth:10];
//    circle1.progress = 0.6;
//    [self.view addSubview:circle1];
//    
//    //无小圆点、同动画时间
//    circle2 = [[CircleProgress alloc] initWithFrame:CGRectMake(xCrack*2+itemWidth, yCrack, itemWidth, itemWidth) pathBackColor:nil pathFillColor:ZZRGB(arc4random()%255, arc4random()%255, arc4random()%255) startAngle:0 strokeWidth:10];
//    circle2.showPoint = NO;
//    circle2.animationModel = CircleIncreaseSameTime;
//    circle2.progress = 0.6;
//    [self.view addSubview:circle2];
//    
//    //自定义起始角度、自定义小圆点、动画从上次数值开始
//    circle3 = [[ZZCircleProgress alloc] initWithFrame:CGRectMake(xCrack, yCrack*2+itemWidth, itemWidth, itemWidth) pathBackColor:nil pathFillColor:ZZRGB(arc4random()%255, arc4random()%255, arc4random()%255) startAngle:-255 strokeWidth:10];
//    circle3.reduceValue = 30;
//    circle3.increaseFromLast = YES;
//    circle3.pointImage = [UIImage imageNamed:@"test_point"];
//    circle3.progress = 0.6;
//    [self.view addSubview:circle3];
//    
//    //同动画时间、隐藏文字
//    circle4 = [[ZZCircleProgress alloc] initWithFrame:CGRectMake(xCrack*2+itemWidth, yCrack*2+itemWidth, itemWidth, itemWidth) pathBackColor:nil pathFillColor:ZZRGB(arc4random()%255, arc4random()%255, arc4random()%255) startAngle:0 strokeWidth:10];
//    circle4.animationModel = CircleIncreaseSameTime;
//    circle4.showProgressText = NO;
//    circle4.progress = 0.3;
//    [self.view addSubview:circle4];

}

- (void)creatSubview{

    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
