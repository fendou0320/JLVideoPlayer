//
//  AppUtily.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/12/9.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "AppUtily.h"

static AppUtily* manager;


@implementation AppUtily

+ (instancetype)shareInstance{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AppUtily alloc] init];
    });
    return manager;
}

+ (void)showAlertViewWithTitle: (NSString *)title message:(NSString*)messageStr{

    [AppUtily shareInstance];
    //创建标题
    NSString *cancelButtonTitle = NSLocalizedString(@"确定", nil);
    //创建UIAlertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:messageStr preferredStyle:UIAlertControllerStyleAlert];
    //创建按钮
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }];
    //将按钮放到UIAlertController
    [alertController addAction:cancelAction];
    //跳转
    //[UIApplication sharedApplication].keyWindow
    UIViewController *ctr = [AppUtily getCurrentVC];
    
    [ctr presentViewController:alertController animated:YES completion:nil];

}

+ (void)showAlertViewWithTitle: (NSString *)title message:(NSString*)messageStr viewCtrl: (UIViewController *)viewCtrl{

    [AppUtily shareInstance];
    //创建标题
    NSString *cancelButtonTitle = NSLocalizedString(@"确定", nil);
    //创建UIAlertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:messageStr preferredStyle:UIAlertControllerStyleAlert];
    //创建按钮
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }];
    //将按钮放到UIAlertController
    [alertController addAction:cancelAction];
    //跳转
    //[UIApplication sharedApplication].keyWindow
    [viewCtrl presentViewController:alertController animated:YES completion:nil];
    
}

#pragma mark - 获取当前控制器
+ (UIViewController *)getCurrentVC{
    
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal){
        
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]]){
        
        result = nextResponder;
    }else{
        
        result = window.rootViewController;
    }
    return result;
}

@end
