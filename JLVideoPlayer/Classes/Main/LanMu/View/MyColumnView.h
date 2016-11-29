//
//  MyColumnView.h
//  cbox
//
//  Created by 王江亮 on 16/7/5.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyColumnView;

@protocol MyColumnViewDelegate <NSObject>
- (void)myColumnView: (MyColumnView *)selfView index: (NSInteger)index;
@end

@interface MyColumnView : UIView

@property (nonatomic, weak) UIView *noDataContentView;
@property (nonatomic, weak) UIView *haveDataContentView;
@property (nonatomic, weak) id<MyColumnViewDelegate> delegate;
/**
 *  我的收藏视图
 *
 *  @param frame
 *  @param delegate
 *
 *  @return
 */
+ (instancetype)myColumnViewWithFrame: (CGRect)frame delegate: (id<MyColumnViewDelegate>)delegate;
/**
 *  数据展现
 */
- (void)chosenData;

@end
