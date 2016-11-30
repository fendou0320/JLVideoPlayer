//
//  RequestManager.h
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/11/28.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetWorking.h"

typedef void (^RequestFinishBlock)(id result);
typedef void (^RequestErrorBlcok)(NSError *error);
typedef void (^DefaultBlock)();

@interface RequestManager : NSObject


/**
 get请求

 @param url         请求地址
 @param beforeBlock 请求之前的操作
 @param finishBlock 请求成功
 @param errorBlock  请求失败
 @param endBlock    请求结束

 @return NSURLSessionDataTask
 */
+(NSURLSessionDataTask *)requestGetWithURL:(NSString *)url beforeBlock:(DefaultBlock)beforeBlock completeBlock:(RequestFinishBlock)finishBlock errorBlock:(RequestErrorBlcok)errorBlock endBlock:(DefaultBlock)endBlock;

/**
 post请求

 @param url         请求地址
 @param params      请求参数字典
 @param beforeBlock 请求之前的操作
 @param finishBlock 请求成功
 @param errorBlock  请求失败
 @param endBlock    请求结束

 @return NSURLSessionDataTask
 */
+(NSURLSessionDataTask *)requestPostWithURL:(NSString *)url parameters:(NSDictionary*)params beforeBlock:(DefaultBlock)beforeBlock completeBlock:(RequestFinishBlock)finishBlock errorBlock:(RequestErrorBlcok)errorBlock endBlock:(DefaultBlock)endBlock;

/**
 取消所有请求
 */
+(void)cancelAllRequest;

/**
 取消指定请求

 @param task 指定task
 */
+(void)cancelRequest: (NSURLSessionDataTask *)task;

@end
