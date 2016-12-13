//
//  SegmentDownloader.h
//  JLVideoPlayer
//  下载的数据模型
//  Created by 王江亮 on 16/12/5.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SegmentDownloader : NSObject

@property (nonatomic,assign) NSString *fileName;
@property (nonatomic,assign) NSString *filePath;
@property (nonatomic,assign) NSString *downloadUrl;
@property (nonatomic,assign) NSString *tmpFileName;
@property (nonatomic,assign) float partProgress;


+ (id)initWithUrl:(NSString*)url andFilePath:(NSString*)filePath andVideoName:(NSString*)videoName;

-(void)start:(BOOL)isPass;

- (void)clean;


@end
