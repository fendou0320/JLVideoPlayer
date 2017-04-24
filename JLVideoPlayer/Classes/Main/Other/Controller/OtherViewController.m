//
//  OtherViewController.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/10/19.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "OtherViewController.h"
#import "ScanQRCodeViewController.h"
#import "GenerateCodeViewController.h"

@interface OtherViewController ()

@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn setTitle:@"扫描二维码" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(ScanQRCodeclickAction:) forControlEvents:UIControlEventTouchUpInside];
//    btn.frame = CGRectMake(0, 100, kScreenWidth, 100);
////    btn.backgroundColor = RandomColor;
//    [self.view addSubview:btn];
//    
//    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn1 setTitle:@"生成二维码" forState:UIControlStateNormal];
//    [btn1 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
//    [btn1 addTarget:self action:@selector(GenerateCodeclickAction:) forControlEvents:UIControlEventTouchUpInside];
//    btn1.frame = CGRectMake(0, 200, kScreenWidth, 100);
//    //    btn.backgroundColor = RandomColor;
//    [self.view addSubview:btn1];
//    
//    [self alertView];
    
}

- (void)alertView{

    [AppUtily showAlertViewWithTitle:@"温馨提示" message:@"示例信息" viewCtrl: self];
    
}

- (void)ScanQRCodeclickAction:(UIButton *)btn{

    ScanQRCodeViewController *scanCtr = [[ScanQRCodeViewController alloc] init];
    [self.navigationController pushViewController:scanCtr animated:YES];
    
}

- (void)GenerateCodeclickAction:(UIButton *)btn{
    
    GenerateCodeViewController *scanCtr = [[GenerateCodeViewController alloc] init];
    [self.navigationController pushViewController:scanCtr animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
