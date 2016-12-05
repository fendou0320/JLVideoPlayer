//
//  SegmentDownloader.h
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/12/5.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SegmentDownloader : NSObject

@property(nonatomic,assign)NSString* fileName;
@property(nonatomic,assign)NSString* filePath;

-(id)initWithUrl:(NSString*)url andFilePath:(NSString*)path andFileName:(NSString*)fileName;


@end
