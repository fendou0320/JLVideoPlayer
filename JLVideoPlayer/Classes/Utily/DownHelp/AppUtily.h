//
//  AppUtily.h
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/12/9.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppUtily : NSObject

@property (nonatomic,weak) UIViewController* viewCtrl;

+ (void)showAlertViewWithTitle: (NSString *)title message:(NSString*)messageStr;

+ (void)showAlertViewWithTitle: (NSString *)title message:(NSString*)messageStr viewCtrl: (UIViewController *)viewCtrl;

+ (UIViewController *)getCurrentVC;

@end
