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

@property (nonatomic,assign) BOOL notififyNoSpace;//标记是不是通知过了存储空间不足


/**
 正在下载的文件数组
 */
@property (nonatomic, strong) NSMutableArray *appDownLoadingArr;
/**
 已经下载的文件数组
 */
@property (nonatomic, strong) NSMutableArray *appDownLoadedArr;
/**
 下载的视频的进度
 */
@property (nonatomic, strong) NSMutableDictionary *appDownLoadingProgressDic;
/**
 当前正在下载的文件
 */
@property (nonatomic, strong) DownModel *currentDownModel;

/**
 已下载的锁
 */
@property (nonatomic, strong) dispatch_semaphore_t app_downLoadedSemaphore;
/**
 下载中的锁
 */
@property (nonatomic, strong) dispatch_semaphore_t app_downLoadingSemaphore;
/**
 下载进度锁
 */
@property (nonatomic, strong) dispatch_semaphore_t app_downLoadingProgressDicSemaphore;
/**
 下载删除锁
 */
@property (nonatomic, strong) dispatch_semaphore_t app_downLoadDeleteSemaphore;

/**
 创建类

 @return DownLoadWrap
 */
+ (DownLoadWrap *)getInstance;
/**
 启动下载文件类
 */
+ (void)initDownload;

///**
// 获取正在下载的文件列表
//
// @return NSMutableArray
// */
//- (NSMutableArray *)getDownLoadingArr;
//
///**
// 获取已经下载的文件列表
//
// @return NSMutableArray
// */
//- (NSMutableArray *)getDownLoadedArr;


/**
 开启下载
 */
- (void)netChangedCacheManager;

@end
