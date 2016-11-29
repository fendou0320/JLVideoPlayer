//
//  CustomHeaderView.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/11/23.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "CustomHeaderView.h"

@implementation CustomHeaderView

- (id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        [self recognizer];
    }
    return self;
}

- (void)recognizer{

    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    panRecognizer.maximumNumberOfTouches = 1;
    panRecognizer.delegate = self;
    [self addGestureRecognizer:panRecognizer];
}

-(void)singleTap:(UITapGestureRecognizer*)recognizer{
    
    //处理单击操作
    
}

- (void)configureWithAvatarURL:(NSURL *)URL VIPInfo:(id)info tapped:(void (^)(void))block{

    [self sd_setImageWithURL:URL];
   
    
}



@end
