//
//  DownLoadManager.h
//  JLVideoPlayer
//  进行下载
//  Created by 王江亮 on 16/12/6.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SegmentDownloader.h"

@interface DownLoadManager : NSObject


/**
 添加下载数据

 @param model 要下载的数据模型
 */
- (void)downLoadingArrAddDownModel: (SegmentDownloader *)model;



@end
