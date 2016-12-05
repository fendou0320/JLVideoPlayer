//
//  SegmentDownloader.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/12/5.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "SegmentDownloader.h"

@implementation SegmentDownloader

-(id)initWithUrl:(NSString*)url andFilePath:(NSString*)filePath andVideoName:(NSString*)videoName{

    self = [super init];
    
    NSString *pathPrefix = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) objectAtIndex:0];
    //保存路径
    NSString *saveTo = [[pathPrefix stringByAppendingPathComponent:@"Downloads"] stringByAppendingPathComponent:filePath];
    //保存文件名字
    NSString *downloadingFileName = [[NSString alloc] initWithString:[saveTo stringByAppendingPathComponent:[videoName stringByAppendingString:@"_etc"]]];
    
    
    return self;
}



@end
