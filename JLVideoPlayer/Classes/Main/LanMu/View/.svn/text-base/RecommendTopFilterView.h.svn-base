//
//  RecommendTopFilterView.h
//  cbox
//
//  Created by 王江亮 on 16/7/15.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterItem.h"
#import "ColumnBaseButton.h"

@class RecommendTopFilterView;


@protocol RecommendTopFilterViewDelegate <NSObject>
@optional
- (void)recommendTopFilterView: (RecommendTopFilterView *)selfView model: (ColumnBaseButton *)btn;
@end


@interface RecommendTopFilterView : UIView

@property (nonatomic, weak) id<RecommendTopFilterViewDelegate> filterDelegate;

@property (nonatomic, strong) NSMutableArray *dataArray;

- (void)clickBtn: (NSInteger)index;

@end
