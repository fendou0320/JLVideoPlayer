//
//  SegmentDownloader.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/12/5.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "SegmentDownloader.h"

@implementation SegmentDownloader

+ (id)initWithUrl:(NSString*)url andFilePath:(NSString*)filePath andVideoName:(NSString*)videoName{

    SegmentDownloader *downLoader = [[SegmentDownloader alloc] init];
    downLoader.downloadUrl = url;
    downLoader.fileName = videoName;
    
    NSString *pathPrefix = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) objectAtIndex:0];
    //保存路径
    NSString *saveTo = [[pathPrefix stringByAppendingPathComponent:@"Downloads"] stringByAppendingPathComponent:filePath];
    downLoader.filePath = saveTo;
    //保存文件名字
    NSString *downloadingFileName = [[NSString alloc] initWithString:[saveTo stringByAppendingPathComponent:[videoName stringByAppendingString:@"_etc"]]];
    downLoader.tmpFileName = downloadingFileName;
    //创建保存文件夹
    NSFileManager *manager = [NSFileManager defaultManager];
    BOOL isExist = [manager fileExistsAtPath:saveTo];
    if (isExist == YES) {
        [manager createDirectoryAtPath:saveTo withIntermediateDirectories:YES attributes:nil error:nil];
    }
    //设置进度
    downLoader.partProgress = 0.0;
    return downLoader;
}






@end
