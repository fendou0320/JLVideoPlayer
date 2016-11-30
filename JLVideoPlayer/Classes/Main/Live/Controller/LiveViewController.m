//
//  LiveViewController.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/10/18.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "LiveViewController.h"

@interface LiveViewController ()

@end

@implementation LiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RandomColor;
    
    NSInteger count = MinCount(100, 200);
    NSLog(@"%ld", count);
    
    
    
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
