//
//  RequestManager.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/11/28.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "RequestManager.h"

static AFHTTPSessionManager *_manager;

@implementation RequestManager

+ (AFHTTPSessionManager *)shareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AFHTTPSessionManager *maneger = [AFHTTPSessionManager manager];
        maneger.responseSerializer = [AFHTTPResponseSerializer serializer];
        maneger.requestSerializer.HTTPShouldHandleCookies = NO;
        _manager = maneger;
    });
}



@end
