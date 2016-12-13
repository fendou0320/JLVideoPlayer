//
//  CommonHelper.h
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/12/9.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonHelper : NSObject

/**
 获取剩余磁盘空间

 @return 字节数
 */
+(uint64_t)getFreeDiskspace;

//+(uint64_t)getTotalDiskspace;
//+(NSString *)getDiskSpaceInfo;



@end
