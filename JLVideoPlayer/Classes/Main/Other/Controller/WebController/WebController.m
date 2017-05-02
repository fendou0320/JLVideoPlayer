//
//  WebController.m
//  JLVideoPlayer
//
//  Created by UCS on 2017/5/2.
//  Copyright © 2017年 WangJiangliang. All rights reserved.
//

#import "WebController.h"
#import <WebKit/WebKit.h>

@interface WebController () 

@end

@implementation WebController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    [self creatWebView];
}

- (void)creatWebView{

    // 创建WKWebView
    WKWebView *webView = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 设置访问的URL
    NSURL *url = [NSURL URLWithString:@"http://www.jianshu.com"];
    // 根据URL创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // WKWebView加载请求
    [webView loadRequest:request];
    // 将WKWebView添加到视图
    [self.view addSubview:webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
