//
//  JackDownHelper.h
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/12/9.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JackDownHelper : NSObject

/**
 创建类

 @return JackDownHelper
 */
+ (JackDownHelper *)shareInstance;
/**
 保存将要下载的文件到plist

 @param downLoadingArray 将要下载的数据列表
 */
- (void)saveDownLoadingFileWithDownLoadingArray:(NSMutableArray *)downLoadingArray;


@end
