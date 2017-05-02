//
//  AppUtily.h
//  JLVideoPlayer
//
//  Created by UCS on 2017/5/2.
//  Copyright © 2017年 WangJiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppUtily : NSObject
@property (nonatomic,weak) UIViewController* viewCtrl;

/**
 获取版本号

 @return 版本号
 */
+ (NSString *)getProjectVersion;
/**
 判断是否第一次启动

 @return bool
 */
+ (BOOL)isFirstRun;
/**
 获取剩余磁盘空间
 
 @return 字节数
 */
+(uint64_t)getFreeDiskspace;

+ (NSInteger)howManyDaysInThisMonth:(NSInteger)year month:(NSInteger)imonth;

+ (NSString *)formatTime:(NSInteger)value;

#define HEX2RGB(string) [AppUtily hex2RGB:string]
+ (UIColor *)hex2RGB:(NSString *)hexColor;

+ (void)showAlertViewWithTitle: (NSString *)title message:(NSString*)messageStr;

+ (void)showAlertViewWithTitle: (NSString *)title message:(NSString*)messageStr viewCtrl: (UIViewController *)viewCtrl;

+ (UIViewController *)getCurrentVC;


@end
