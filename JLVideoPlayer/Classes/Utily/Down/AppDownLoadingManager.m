//
//  AppDownLoadingManager.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/12/8.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "AppDownLoadingManager.h"

static AppDownLoadingManager *manager;
static dispatch_queue_t loadingQueue;
static dispatch_semaphore_t startDownSemaphore;

@implementation AppDownLoadingManager

+ (instancetype)shareAppDownLoadingManager{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AppDownLoadingManager *_manager = [[AppDownLoadingManager alloc] init];
        manager = _manager;
        loadingQueue = dispatch_queue_create("DownLoadQueue", NULL);
        startDownSemaphore = dispatch_semaphore_create(1);
    });
    return manager;
}

//检查是否已经有了model.ivd，没有则添加model；
//是否有正在下载的，没有就直接下载，否则就进入等待队列。
//若直接下载，model.downloader是否已初始化，若初始化执行startDownloadVideo, 若没有要进行初始化再执行startDownloadVideo。
#pragma mark - 向下载队列添加model，若没有正在下载的视频，则直接进入下载，否则进入等待
- (void)downLoadingArrayAddDownModel:(DownModel *)model{

    [AppDownLoadingManager shareAppDownLoadingManager];
    
    dispatch_async(loadingQueue, ^{
        
        //等待执行保存的已下载、未下载等数据读取完成
        //获取下载锁
        dispatch_semaphore_t app_downLoadingSemaphore = [DownLoadWrap getInstance].app_downLoadingSemaphore;
        dispatch_semaphore_wait(app_downLoadingSemaphore, DISPATCH_TIME_FOREVER);
        
        //标识是否有正在下载文件
        BOOL isHaveModel = NO;
        //判断是否有正在下载文件
        for (DownModel *dm in [DownLoadWrap getInstance].appDownLoadingArr ) {
            if ([dm.vid isEqualToString:model.vid]) {
                isHaveModel = YES;
                break;
            }
        }
        
        //如果当前没有在下载队列中，添加进下载队列,并且保存下载进度为0
        if (isHaveModel == NO) {
            if (model.vid != nil) {
                //获取下载进度
                dispatch_semaphore_t app_downLoadingProgressDicSemaphore =[DownLoadWrap getInstance].app_downLoadingProgressDicSemaphore;
                dispatch_semaphore_wait(app_downLoadingProgressDicSemaphore, DISPATCH_TIME_FOREVER);
                
                NSMutableDictionary *progressDic = [DownLoadWrap getInstance].appDownLoadingProgressDic;
                //将新model保存到下载进度中
                [progressDic setObject:[NSNumber numberWithFloat:0.0f] forKey:model.vid];
                dispatch_semaphore_signal([DownLoadWrap getInstance].app_downLoadingProgressDicSemaphore);

                model.isLoading = NO;
                //添加进数组
                [[DownLoadWrap getInstance].appDownLoadingArr addObject:model];
                
            }else{
                [NSException raise:@"AppDownLoadingManager" format:@"下载视频的vid为异常"];
            }
        }
        
        //等待
        dispatch_semaphore_wait(startDownSemaphore, DISPATCH_TIME_FOREVER);
        //判断是否已经在下载队列中
        BOOL isHaveDownLoading = NO;
        for (DownModel *dm in [DownLoadWrap getInstance].appDownLoadingArr) {
            if ([dm.vid isEqualToString:model.vid]&&(dm.downModelState == DownModelState_Loading)) {
                isHaveDownLoading = YES;
                break;
            }
        }
        
        //如果已经在下载之中
        if (isHaveDownLoading == NO) {
            
            model.downModelState = DownModelState_Loading;
            //开始下载，保存下载状态
            [[JackDownHelper shareInstance] saveDownLoadingFileWithDownLoadingArray:[DownLoadWrap getInstance].appDownLoadingArr];
            
            dispatch_semaphore_signal([DownLoadWrap getInstance].app_downLoadingSemaphore);
            
            //判断网络
            AFNetworkReachabilityStatus netWorkState = [MonitoringNetwork monitoringNetworkState];
            if (netWorkState != AFNetworkReachabilityStatusReachableViaWiFi) {
                return ;
            }
            //判断内存是否够用
            if ([CommonHelper getFreeDiskspace] < (200 * 1024 * 1024)) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [AppUtily showAlertViewWithTitle:@"温馨提示" message:@"内存不足"];
                });
            }
            
            //标记存储空间足够
            [DownLoadWrap getInstance].notififyNoSpace = NO;
            if (model.downLoader && !model.downLoader.bDownloading && !model.isLoading) {
                //开始下载
                model.downLoader.bDownloading = YES;
                [model.downLoader ]
            }
            
            
        }
        
        
        
    });
}







@end
