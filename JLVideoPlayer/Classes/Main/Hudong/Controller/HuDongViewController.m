//
//  HuDongViewController.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/10/18.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "HuDongViewController.h"
#import "DongHuaViewController.h"
#import "TuXingViewController.h"

@interface HuDongViewController ()

@end

@implementation HuDongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RandomColor;

    UIButton *clickBtn = [[UIButton alloc]initWithFrame:CGRectMake(50, 100, 100, 100)];
    [clickBtn setTitle:@"各种动画" forState:UIControlStateNormal];
    clickBtn.backgroundColor = [UIColor redColor];
    [clickBtn addTarget:self action:@selector(sendBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: clickBtn];
    
    UIButton *yuanzhuBtn = [[UIButton alloc]initWithFrame:CGRectMake(50, 300, 100, 100)];
    [yuanzhuBtn setTitle:@"圆柱形" forState:UIControlStateNormal];
    yuanzhuBtn.backgroundColor = [UIColor redColor];
    [yuanzhuBtn addTarget:self action:@selector(yuanzhuBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: yuanzhuBtn];

    
}

- (void)sendBtnClicked:(UIButton *)sender{

    DongHuaViewController *donghua = [[DongHuaViewController alloc] init];
    [self.navigationController pushViewController:donghua animated:YES];
    
}

- (void)yuanzhuBtnClicked:(UIButton *)sender{
    
    TuXingViewController *donghua = [[TuXingViewController alloc] init];
    [self.navigationController pushViewController:donghua animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
