//
//  CustomLabel.h
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/10/17.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, VerticalAlignment){
    
    VerticalAlignmentTop = 0, // default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
};

@interface CustomLabel : UILabel

@property (nonatomic) VerticalAlignment verticalAlignment;


@end
