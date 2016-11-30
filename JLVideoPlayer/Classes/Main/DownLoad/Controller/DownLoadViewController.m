//
//  DownLoadViewController.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/10/18.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "DownLoadViewController.h"

@interface DownLoadViewController ()

@end

@implementation DownLoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RandomColor;

    NSString *url = @"http://cbox.cntv.cn/json2015/other/scyx/index.json";
    
    NSURLSessionDataTask *task = [RequestManager requestGetWithURL:url beforeBlock:^{
        
    } completeBlock:^(id result) {
        
        NSLog(@"%@", result);
        
    } errorBlock:^(NSError *error) {
        
    } endBlock:^{
        
    }];
        

    
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
