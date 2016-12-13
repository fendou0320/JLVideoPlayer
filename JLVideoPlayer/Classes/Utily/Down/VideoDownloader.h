//
//  VideoDownloader.h
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/12/12.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SegmentDownloader.h"

@interface VideoDownloader : NSObject{

    NSMutableArray *downloadArray;
    
    NSInteger _segmentIndex;
    NSInteger objTotalCount; //切片总数
    NSInteger objCurrentCount; //已完成的总数
    
    dispatch_semaphore_t downLoaderSemaphore;
    NSMutableDictionary *progressDic;
}


@property (nonatomic, assign) BOOL bDownloading;

//开始下载
-(void)startDownloadVideo;

//暂停下载
-(void)stopDownloadVideo;



@end
