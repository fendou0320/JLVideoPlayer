//
//  ColumnBannerView.h
//  cbox
//
//  Created by 王江亮 on 16/7/18.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ColumnBannerView;

@protocol ColumnBannerViewDelegate <NSObject>
@optional
/**
 *  点击轮滑图
 *
 *  @param view   自身
 *  @param index  页数索引
 *  @param sender 留白内容
 */
- (void)columnBannerView: (ColumnBannerView *)view OnSpecialBannerPageChange:(int)index view:(id)sender;
@end


@interface ColumnBannerView : UIView<SpecialBannerDelegate>

@property (nonatomic, weak)id<ColumnBannerViewDelegate> bannerDelegate;

@property (nonatomic, strong)NSArray* bigImageArray;

+ (instancetype)ColumnBannerViewWithFrame:(CGRect)frame Delegate:(id<ColumnBannerViewDelegate>)delegate;



@end
