//
//  DownLoadWrap.h
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/12/6.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DownModel.h"

@interface DownLoadWrap : NSObject

/**
 启动下载文件类
 */
+ (void)initDownload;
/**
 获取正在下载的文件列表

 @return NSMutableArray
 */
+ (NSMutableArray *)getDownLoadingArr;

/**
 获取已经下载的文件列表

 @return NSMutableArray
 */
+ (NSMutableArray *)getDownLoadedArr;




@end
