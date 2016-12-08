//
//  DownModel.h
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/12/7.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 下载视频的码率

 - DownLoadMalvLow:  低码率
 - DownLoadMalvHigh: 高码率
 */
typedef NS_ENUM(NSUInteger, DownLoadMalv){
    DownLoadMalv_Low = 1,
    DownLoadMalv_High = 2,
};

typedef NS_ENUM(NSUInteger, DownModelState){

    DownModelState_Loading = 1,
    DownModelState_Suspend = 2,
    DownModelState_Waiting = 3,

};

@interface DownModel : NSObject

/**
 播放地址
 */
@property (nonatomic,retain) NSString * playURL;
/**
 下载地址
 */
@property (nonatomic,retain) NSString * downURL;
/**
 文件名字
 */
@property (nonatomic,retain) NSString * downFileName;
/**
 图片
 */
@property (nonatomic,retain) NSString * downImageString;
/**
 码率
 */
@property (nonatomic,assign) CGFloat mbps;

/**
 当前进度
 */
@property (nonatomic, assign) double curProgress;
/**
 文件总大小
 */
@property (nonatomic, assign) long long fileTotalSize;
/**
 Vid
 */
@property (nonatomic, assign) NSString *vid;
/**
 正在数据解析
 */
@property (nonatomic, assign) BOOL isLoading;
/**
 下载码率
 */
@property (nonatomic, assign) DownLoadMalv downModelMalv;
/**
 下载状态
 */
@property (nonatomic, assign) DownModelState downModelState;

//@property (nonatomic, strong) NSString *neededType;
//@property (nonatomic, strong) M3U8Handler *handler;
//@property (nonatomic, strong) VideoDownloader *downloader;
//@property (nonatomic, assign) BOOL canPlay;
//@property (nonatomic, strong) NSString* vid;
//@property (nonatomic, assign) DownLoadMalv downModelMalv;

//从已下载进入小窗播放器
@property (nonatomic, strong) NSString *dianboSetId;
@property (nonatomic,retain) NSString *vtype;
@property (nonatomic,retain) NSString *cid;
@property (nonatomic,retain) NSString *listurl;
@property (nonatomic,retain) NSString *videoImgUrl;
@property (nonatomic,retain) NSString *vsetPageid;
@property (nonatomic,assign) int columnSo;
@property (nonatomic,retain) NSString *adId;
@property (nonatomic,retain) NSString *dianboSetName;



@end
