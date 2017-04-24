//
//  HuDongViewController.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/10/18.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "HuDongViewController.h"
#import "DongHuaViewController.h"

@interface HuDongViewController ()

@end

@implementation HuDongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RandomColor;

    UIButton *clickBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [clickBtn setTitle:@"各种动画" forState:UIControlStateNormal];
    clickBtn.backgroundColor = [UIColor greenColor];
    [clickBtn addTarget:self action:@selector(sendBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: clickBtn];
    
}

- (void)sendBtnClicked:(UIButton *)sender{

    DongHuaViewController *donghua = [[DongHuaViewController alloc] init];
    
    [self.navigationController pushViewController:donghua animated:YES];
    
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
