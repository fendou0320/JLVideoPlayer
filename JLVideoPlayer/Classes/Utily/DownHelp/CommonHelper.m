//
//  CommonHelper.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/12/9.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "CommonHelper.h"

@implementation CommonHelper

+(uint64_t)getFreeDiskspace {
    
    uint64_t totalSpace = 0.0f;
    uint64_t totalFreeSpace = 0.0f;
    
    NSError *error = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[paths lastObject] error:&error];
    if (dictionary) {
        NSNumber *fileSystemSizeInBytes = [dictionary objectForKey: NSFileSystemSize];
        NSNumber *freeFileSystemSizeInBytes = [dictionary objectForKey:NSFileSystemFreeSize];
        totalSpace = [fileSystemSizeInBytes floatValue];
        totalFreeSpace = [freeFileSystemSizeInBytes floatValue];
    }else{
        
        NSLog(@"Error Obtaining System Memory Info: Domain = %@, Code = %ld", [error domain], (long)[error code]);
    }
    
    return totalFreeSpace;
}

//+(uint64_t)getTotalDiskspace {
//    uint64_t totalSpace = 0.0f;
//    NSError *error = nil;
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[paths lastObject] error: &error];
//    
//    if (dictionary) {
//        NSNumber *fileSystemSizeInBytes = [dictionary objectForKey: NSFileSystemSize];
//        totalSpace = [fileSystemSizeInBytes floatValue];
//    } else {
//        NSLog(@"Error Obtaining System Memory Info: Domain = %@, Code = %d", [error domain], [error code]);
//    }
//    
//    return totalSpace;
//}
//+(NSString *)getDiskSpaceInfo
//{
//    uint64_t totalSpace = 0.0f;
//    uint64_t totalFreeSpace = 0.0f;
//    NSError *error = nil;
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[paths lastObject] error: &error];
//    
//    if (dictionary)
//    {
//        NSNumber *fileSystemSizeInBytes = [dictionary objectForKey: NSFileSystemSize];
//        NSNumber *freeFileSystemSizeInBytes = [dictionary objectForKey:NSFileSystemFreeSize];
//        totalSpace = [fileSystemSizeInBytes floatValue];
//        totalFreeSpace = [freeFileSystemSizeInBytes floatValue];
//    }else
//        return nil;
//    
//    //    NSString *infostr = [NSString stringWithFormat:@"%.2f GB 可用/总空间 %.2f GB", ((totalFreeSpace/1024.0f)/1024.0f)/1024.0f, ((totalSpace/1024.0f)/1024.0f)/1024.0f];
//    NSString *infostr = [NSString stringWithFormat:@"总空间 %.1f G/剩余 %.1f G",((totalSpace/1024.0f)/1024.0f)/1024.0f,((totalFreeSpace/1024.0f)/1024.0f)/1024.0f];
//    
//    return infostr;
//    
//}


@end
