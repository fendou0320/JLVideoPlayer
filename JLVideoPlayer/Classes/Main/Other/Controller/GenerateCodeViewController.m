//
//  GenerateCodeViewController.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/11/16.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "GenerateCodeViewController.h"

@interface GenerateCodeViewController ()

@end

@implementation GenerateCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RandomColor;
    
    CGFloat a = kScreenWidth/2;
    CGFloat b = kScreenHeight/2;
    UIImage *img1 = [GenerateCode generateImageForString:@"王先生" imageSize:a logoImageSize:b];
    UIImage *img = [GenerateCode imageBlackToTransparent:img1 withRed:0.2 andGreen:0.5 andBlue:0.5];
    
    UIImageView *scanViewBg = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/4, kScreenHeight/4, kScreenWidth/2, kScreenHeight/2)];
    [scanViewBg setImage:img];
    [self.view addSubview:scanViewBg];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
