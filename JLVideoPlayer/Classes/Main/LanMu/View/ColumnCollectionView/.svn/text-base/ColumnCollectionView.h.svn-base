//
//  ColumnCollectionView.h
//  cbox
//
//  Created by 王江亮 on 16/7/3.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColumnBaseCollectionViewCell.h"
#import "ColumnChannelModel.h"

@class ColumnCollectionView;

@protocol ColumnCollectionViewDelegate <NSObject>
@optional
- (void)columnCollectionView: (ColumnCollectionView *)selfView didSelectItem: (NSInteger)didItem;
@end

@interface ColumnCollectionView : UICollectionView<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>


@property (nonatomic, weak) id<ColumnCollectionViewDelegate> columnDelegate;

+ (instancetype)columnCollectionViewWithFrame: (CGRect)frame delegate: (id<ColumnCollectionViewDelegate>) delegate;

@property (nonatomic, strong) NSMutableArray *dataArr;

@end
