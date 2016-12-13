//
//  AppDownLoadingManager.h
//  JLVideoPlayer
//  下载队列
//  Created by 王江亮 on 16/12/8.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppDownLoadingManager : NSObject

+ (instancetype)shareAppDownLoadingManager;

/**
 向下载队列添加model，若没有正在下载的视频，则直接进入下载，否则进入等待

 @param model 下载model
 */
- (void)downLoadingArrayAddDownModel:(DownModel *)model;


@end
