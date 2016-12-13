//
//  DownLoadWrap.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/12/6.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "DownLoadWrap.h"

static DownLoadWrap * downWrap;

@interface DownLoadWrap ()

@end

@implementation DownLoadWrap

+ (DownLoadWrap *)getInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DownLoadWrap *downLoad = [[DownLoadWrap alloc] init];
        downWrap = downLoad;
    });
    return downWrap;
}

+ (void)initDownload{

    DownLoadWrap *downLoad = [DownLoadWrap getInstance];
    
    downLoad.appDownLoadedArr = [NSMutableArray arrayWithCapacity:1];
    downLoad.appDownLoadingArr = [NSMutableArray arrayWithCapacity:1];

    downLoad.app_downLoadedSemaphore = dispatch_semaphore_create(1);
    downLoad.app_downLoadingSemaphore = dispatch_semaphore_create(1);
    downLoad.app_downLoadingProgressDicSemaphore = dispatch_semaphore_create(1);
    downLoad.app_downLoadDeleteSemaphore = dispatch_semaphore_create(1);
    
    //创建单一线程执行
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        
        NSString *document = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        //获取正在下载的model
        NSString *plistPathing = [[document stringByAppendingPathComponent:kPathDownload]stringByAppendingPathComponent:@"downLoadingPlist.plist"];
        //正在下载的文件进度
        NSString *plistPathingProgress = [[document stringByAppendingPathComponent:kPathDownload]stringByAppendingPathComponent:@"downLoadingProgressDic.plist"];
        //判断文件是否存在
        BOOL isPlistPathing = [[NSFileManager defaultManager] fileExistsAtPath:plistPathing];
        BOOL isPlistPathingProgress = [[NSFileManager defaultManager] fileExistsAtPath:plistPathingProgress];
        
        if ((isPlistPathing == YES)&&(isPlistPathingProgress == YES)) {
            
            NSMutableArray * downingArr = [[NSMutableArray alloc]initWithContentsOfFile:plistPathing];
            NSMutableDictionary *downingDic = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPathingProgress];
            
            for (NSDictionary *dic in downingArr){
            
                DownModel *model = [[DownModel alloc] init];
                model.downFileName = [dic objectForKey:@"filename"];
                model.downURL = [dic objectForKey:@"fileurl"];
                model.downImageString = [dic objectForKey:@"fileImage"];
                model.vid = [dic objectForKey:@"vid"];
                model.playURL = [dic objectForKey:@"playUrl"];
                //进度
                model.curProgress = [[downingDic objectForKey:model.vid] floatValue];
                model.isLoading = NO;
                //码率
                if ([[dic objectForKey:@"malv"] isEqualToString:@"high"]) {
                    model.downModelMalv = DownLoadMalv_High;
                }else{
                    model.downModelMalv = DownLoadMalv_Low;
                }
                //下载状态
                NSString *downState = [dic objectForKey:@"downModelState"];
                if ([downState isEqualToString:@"loading"]) {
                    model.downModelState = DownModelState_Loading;
                    downWrap.currentDownModel = model;
                }else if ([downState isEqualToString:@"waiting"]){
                    model.downModelState = DownModelState_Waiting;
                }else{
                    model.downModelState = DownModelState_Suspend;
                }
                //总大小
                model.fileTotalSize = [[dic objectForKey:@"fileTotalSize"]longLongValue];
                
                model.dianboSetId = [dic objectForKey:@"dianboSetId"];
                model.vtype = [dic objectForKey:@"vtype"];
                model.cid = [dic objectForKey:@"cid"];
                model.listurl = [dic objectForKey:@"listurl"];
                model.videoImgUrl = [dic objectForKey:@"videoImgUrl"];
                model.vsetPageid = [dic objectForKey:@"vsetPageid"];
                model.columnSo = [[dic objectForKey:@"columnSo"]intValue];
                model.adId = [dic objectForKey:@"adId"];
                model.dianboSetName = [dic objectForKey:@"dianboSetName"];
                
                [downWrap.appDownLoadingArr addObject:model];
            }
        }
        //获取已经下载的model
        NSString *plistPath = [[document stringByAppendingPathComponent:kPathDownload]stringByAppendingPathComponent:@"finishPlist.plist"];
        BOOL isFinish = [[NSFileManager defaultManager] fileExistsAtPath:plistPath];
        if (isFinish == YES) {
            
            NSMutableArray *finishArr = [[NSMutableArray alloc]initWithContentsOfFile:plistPath];
            for (NSDictionary *dic in finishArr) {
                
                DownModel *file = [[DownModel alloc]init];

                file.downFileName = [dic objectForKey:@"filename"];
                file.downURL = [dic objectForKey:@"fileurl"];
                file.downImageString = [dic objectForKey:@"fileImage"];
                file.vid = [dic objectForKey:@"vid"];
                file.cid = [dic objectForKey:@"cid"];
                file.fileTotalSize = [[dic objectForKey:@"fileTotalSize"] longLongValue];
                
                file.dianboSetId = [dic objectForKey:@"dianboSetId"];
                file.vtype = [dic objectForKey:@"vtype"];
                file.listurl = [dic objectForKey:@"listurl"];
                file.videoImgUrl = [dic objectForKey:@"videoImgUrl"];
                file.vsetPageid = [dic objectForKey:@"vsetPageid"];
                file.columnSo = [[dic objectForKey:@"columnSo"]intValue];
                file.adId = [dic objectForKey:@"adId"];
                file.dianboSetName = [dic objectForKey:@"dianboSetName"];
                
                [downWrap.appDownLoadedArr addObject:file];                
            }
        }
        
        if (downWrap.currentDownModel != nil) {
            //有网络
            AFNetworkReachabilityStatus status = [MonitoringNetwork monitoringNetworkState];
            if (status == AFNetworkReachabilityStatusReachableViaWWAN) {
                //提示当前网络状态是流量
            }
            if (status == AFNetworkReachabilityStatusReachableViaWiFi) {
                //当前网络状态是wifi
                AppDownLoadingManager *manager = [AppDownLoadingManager shareAppDownLoadingManager];
                [manager downLoadingArrayAddDownModel: downWrap.currentDownModel];
            }
        }
    });
    
}


- (NSMutableArray *)getDownLoadingArr{
    
    return downWrap.appDownLoadingArr;
}

- (NSMutableArray *)getDownLoadedArr{

    return downWrap.appDownLoadedArr;
}

- (void)netChangedCacheManager{
    
    BOOL allowCache = NO;
    AFNetworkReachabilityStatus status = [MonitoringNetwork monitoringNetworkState];
    if (status == AFNetworkReachabilityStatusReachableViaWiFi) {
        allowCache = YES;
    }else{
        allowCache = NO;
    }
    //允许缓存
    if (allowCache == YES) {
        
        if (_app_downLoadingSemaphore) {
            for (DownModel *model in _appDownLoadingArr) {
                if (model.downModelState == DownModelState_Loading) {
                    if (model.downLoader) {
                        [model.downLoader ]
                    }
                }
            }
        }
        
    }
    
}





@end
