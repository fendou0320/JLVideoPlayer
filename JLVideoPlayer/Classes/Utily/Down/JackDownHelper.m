//
//  JackDownHelper.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/12/9.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "JackDownHelper.h"

static JackDownHelper *jackDownManager;

@implementation JackDownHelper

+ (JackDownHelper *)shareInstance{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        JackDownHelper *manager = [[JackDownHelper alloc] init];
        jackDownManager = manager;
    });
    return jackDownManager;
}

#pragma mark - 保存将要下载的文件到plist
-(void)saveDownLoadingFileWithDownLoadingArray:(NSMutableArray *)downLoadingArray{
    
    if ((downLoadingArray == nil)||(downLoadingArray.count == 0)) {
        return;
    }
    
    NSMutableArray *downLoadinginfo = [[NSMutableArray alloc] init];
    
    for (DownModel *fileinfo in downLoadinginfo) {
        //设置码率
        NSString *malvStr;
        if (fileinfo.downModelMalv == DownLoadMalv_High) {
            malvStr = @"high";
        }else{
            malvStr = @"low";
        }
        //设置下载状态
        NSString *downState;
        switch (fileinfo.downModelState) {
            case DownModelState_Loading:
                downState = @"loading";
                break;
            case DownModelState_Waiting:
                downState = @"waiting";
                break;
            case DownModelState_Suspend:
                downState = @"suspend";
                break;
            default:
                downState = @"suspend";
                break;
        }
        
        NSDictionary *filedic = [NSDictionary dictionaryWithObjectsAndKeys:
                                 fileinfo.downFileName,@"filename",
                                 fileinfo.downURL,@"fileurl",
                                 fileinfo.downImageString,@"fileImage",
                                 fileinfo.vid,@"vid",
                                 malvStr,@"malv",
                                 fileinfo.playURL,@"playUrl",
                                 downState,@"downModelState",
                                 fileinfo.dianboSetId,@"dianboSetId",
                                 fileinfo.vtype,@"vtype",
                                 fileinfo.cid,@"cid",
                                 fileinfo.listurl,@"listurl",
                                 fileinfo.videoImgUrl,@"videoImgUrl",
                                 fileinfo.vsetPageid,@"vsetPageid",
                                 fileinfo.adId,@"adId",
                                 @(fileinfo.columnSo),@"columnSo",
                                 fileinfo.dianboSetName,@"dianboSetName",
                                 @(fileinfo.fileTotalSize),@"fileTotalSize",
                                 nil];
        
        [downLoadinginfo addObject:filedic];
    }
    
    NSString *document = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *loadPathStr = [document stringByAppendingPathComponent:kPathDownload];
    NSString *plistPath = [loadPathStr stringByAppendingPathComponent:@"downLoadingPlist.plist"];
    NSString *plistPathDic = [loadPathStr stringByAppendingPathComponent:@"downLoadingProgressDic.plist"];

    NSFileManager *fileManager = [NSFileManager defaultManager];
    //如果没有该文件夹，创建文件夹
    if (![fileManager fileExistsAtPath:loadPathStr]) {
        [fileManager createDirectoryAtPath:loadPathStr withIntermediateDirectories:YES attributes:nil error:nil];
//        NSURL *dataUrl = [NSURL URLWithString:loadPathStr];
//        [AppUtily addSkipBackupAttributeToItemAtURL:dataUrl];
    }
    //保存文件
    BOOL isWrite = [downLoadinginfo writeToFile:plistPath atomically:YES];
    if (isWrite == NO) {
        NSLog(@"保存文件失败");
    }
    //保存进度
    [[DownLoadWrap getInstance].appDownLoadingProgressDic writeToFile:plistPathDic atomically:YES];
    
}




@end
