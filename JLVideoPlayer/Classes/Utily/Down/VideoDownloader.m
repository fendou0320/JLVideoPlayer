//
//  VideoDownloader.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/12/12.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "VideoDownloader.h"

@implementation VideoDownloader

-(void)startDownloadVideo{

    //判断网络
    AFNetworkReachabilityStatus state = [MonitoringNetwork monitoringNetworkState];
    
    if (state == AFNetworkReachabilityStatusReachableViaWiFi) {
        
    }else{
    
    }
    
}

//暂停下载
-(void)stopDownloadVideo{

    dispatch_semaphore_wait(downLoaderSemaphore, DISPATCH_TIME_FOREVER);
    if (self.bDownloading && downloadArray != nil) {
        
        for (SegmentDownloader *obj in downloadArray) {
            
//            [obj ]
        }
    }
    
    
}



@end
