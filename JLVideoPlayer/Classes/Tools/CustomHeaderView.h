//
//  CustomHeaderView.h
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/11/23.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomHeaderView : UIImageView<UIGestureRecognizerDelegate>

- (void)configureWithAvatarURL:(NSURL *)URL VIPInfo:(id)info tapped:(void (^)(void))block;


@end
