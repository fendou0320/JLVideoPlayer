//
//  RequestManager.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/11/28.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "RequestManager.h"

static AFHTTPSessionManager *_manager;

@implementation RequestManager

+ (AFHTTPSessionManager *)shareManager{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        //申明返回的结果是json类型
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        //申明请求的数据是json类型
        manager.requestSerializer=[AFJSONRequestSerializer serializer];
        //如果报接受类型不一致请替换一致text/html或别的
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json",@"text/plain",@"text/javascript",@"text/xml",@"image/*", nil];
        //清求时间设置
        manager.requestSerializer.timeoutInterval = 30;
        //要设置请求登陆时不保存cookies,这里可以设置
        manager.requestSerializer.HTTPShouldHandleCookies = NO;
        // 设置允许同时最大并发数量，过大容易出问题
        manager.operationQueue.maxConcurrentOperationCount = 3;
        _manager = manager;
    });
    return _manager;
}

//{
//    // 1.初始化单例类
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.securityPolicy.SSLPinningMode = AFSSLPinningModeCertificate;
//    // 2.设置证书模式
//    NSString * cerPath = [[NSBundle mainBundle] pathForResource:@"xxx" ofType:@"cer"];
//    NSData * cerData = [NSData dataWithContentsOfFile:cerPath];
//    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate withPinnedCertificates:[[NSSet alloc] initWithObjects:cerData, nil]];
//    // 客户端是否信任非法证书
//    mgr.securityPolicy.allowInvalidCertificates = YES;
//    // 是否在证书域字段中验证域名
//    [mgr.securityPolicy setValidatesDomainName:NO];
//}
//
//{
//    // 1.初始化单例类
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    // 2.设置非校验证书模式
//    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
//    manager.securityPolicy.allowInvalidCertificates = YES;
//    [manager.securityPolicy setValidatesDomainName:NO];
//}
////基本配置
//{
//    switch (sg_requestType) {
//        case kHYBRequestTypeJSON: {
//            manager.requestSerializer = [AFJSONRequestSerializer serializer];
//            break;
//        }
//        case kHYBRequestTypePlainText: {
//            manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//            break;
//        }
//        default: {
//            break;
//        }
//    }
//    
//    switch (sg_responseType) {
//        case kHYBResponseTypeJSON: {
//            manager.responseSerializer = [AFJSONResponseSerializer serializer];
//            break;
//        }
//        case kHYBResponseTypeXML: {
//            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
//            break;
//        }
//        case kHYBResponseTypeData: {
//            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//            break;
//        }
//        default: {
//            break;
//        }
//    }
//}

+(NSURLSessionDataTask *)requestGetWithURL:(NSString *)url beforeBlock:(DefaultBlock)beforeBlock completeBlock:(RequestFinishBlock)finishBlock errorBlock:(RequestErrorBlcok)errorBlock endBlock:(DefaultBlock)endBlock{

    if (url == nil || url.length == 0) {
        url = @"";
    }
    
    if (beforeBlock) beforeBlock();
    //去掉空字符串
    NSString *urlStr = [url stringByReplacingOccurrencesOfString:@" " withString:@""];
    //utf8转码
    NSString *urlUTF8 = [NSString stringWithString:[urlStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    AFHTTPSessionManager *manager = [RequestManager shareManager];
    
    NSURLSessionDataTask *task = [manager GET:urlUTF8 parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
      
       // NSString *resultString = [NSString stringWithString:operation.responseString];
        NSData *resData = [[NSData alloc] initWithData:[responseObject dataUsingEncoding:NSUTF32BigEndianStringEncoding]];
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];

        
  //      NSLog(@"%@", [responseObject class]);
        
   // NSDictionary *weatherDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
     //   NSData *resData = [[NSData alloc] initWithData:[responseObject dataUsingEncoding:NSUTF8StringEncoding]];

     //   NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
   //     NSString *resultDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];

        
#ifdef DEBUG
        NSLog(@"返回数据： %@", responseObject);
#endif
        if (finishBlock) finishBlock(responseObject);
        if (endBlock) endBlock();

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (errorBlock) errorBlock(error);
        if (endBlock) endBlock();

    }];
    return task;
}


+(NSURLSessionDataTask *)requestPostWithURL:(NSString *)url parameters:(NSDictionary*)params beforeBlock:(DefaultBlock)beforeBlock completeBlock:(RequestFinishBlock)finishBlock errorBlock:(RequestErrorBlcok)errorBlock endBlock:(DefaultBlock)endBlock{

    if (url == nil || url.length == 0) {
        url = @"";
    }
    
    if (beforeBlock) beforeBlock();

    //去掉空字符串
    NSString *urlStr = [url stringByReplacingOccurrencesOfString:@" " withString:@""];
    //utf8转码
    NSString *urlUTF8 = [NSString stringWithString:[urlStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    AFHTTPSessionManager *manager = [RequestManager shareManager];
    
    NSURLSessionDataTask *task = [manager POST:urlUTF8 parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *resultString = [NSString stringWithString: responseObject];
        NSData *resData = [[NSData alloc] initWithData:[resultString dataUsingEncoding:NSUTF8StringEncoding]];
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
#ifdef DEBUG
        NSLog(@"返回数据： %@", resultString);
#endif
        if (finishBlock) finishBlock(resultDic);
        if (endBlock) endBlock();
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (errorBlock) errorBlock(error);
        if (endBlock) endBlock();
    }];
    
    return task;
}


+(void)cancelAllRequest{

    
}


+(void)cancelRequest: (NSURLSessionDataTask *)task{

    
}




@end
