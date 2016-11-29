//
//  GenerateCode.h
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/11/16.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GenerateCode : NSObject

#pragma mark - 生成二维码
//有背景图片
+ (UIImage *)qrImageForString:(NSString *)string imageSize:(CGFloat)Imagesize logoImageSize:(CGFloat)waterImagesize;

//无背景图片
+ (UIImage *)generateImageForString:(NSString *)string imageSize:(CGFloat)Imagesize logoImageSize:(CGFloat)waterImagesize;

//添加颜色
+ (UIImage*)imageBlackToTransparent:(UIImage*)image withRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue;

+ (UIImage *)generateImage: (NSString *)str width: (CGFloat)width height: (CGFloat)height;

#pragma mark - 读取二维码图片的信息
/**
 *  读取图片中二维码信息
 *
 *  @param image 图片
 *
 *  @return 二维码内容
 */
+(NSString *)readCodeFromImage:(UIImage *)image;


@end
