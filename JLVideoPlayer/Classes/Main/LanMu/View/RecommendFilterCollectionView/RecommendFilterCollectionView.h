//
//  RecommendFilterCollectionView.h
//  cbox
//
//  Created by 王江亮 on 16/7/15.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RecommendFilterCollectionView;
/**
 视图类型
 */
typedef enum {
    RecommendFilterCollectionViewTypeFour = 4,
    RecommendFilterCollectionViewTypeSix = 6,
    RecommendFilterCollectionViewTypeSixLanMU = 8,
}RecommendFilterCollectionViewType;

@protocol RecommendFilterCollectionViewDelegate <NSObject>
@optional
/**
 *  传递点击的数据
 *
 *  @param collectionView
 *  @param indexpath      indexpath
 */
- (void)recommendFilterCollectionView : (RecommendFilterCollectionView *)collectionView withIndexpath: (NSIndexPath *)indexpath;
/**
 *  滑动监测
 *
 *  @param collectionView
 *  @param scrollView
 */
- (void)recommendFilterCollectionView:(RecommendFilterCollectionView *)collectionView didScrollToUp:(UIScrollView *)scrollView;
@end

@interface RecommendFilterCollectionView : UICollectionView<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) id<RecommendFilterCollectionViewDelegate> recommendFilterDelegate;
/**
 *  筛选collectionview
 *
 *  @param frame          frame
 *  @param type           类型
 *  @param filterDelegate 代理
 *
 *  @return
 */
+ (instancetype)recommendFilterCollectionView: (CGRect)frame withCellType: (RecommendFilterCollectionViewType)type withDelegate:(id<RecommendFilterCollectionViewDelegate>)filterDelegate;
/**
 *  数据
 */
@property (nonatomic, strong) NSMutableArray *data;
/**
 *  判断是否上滑
 */
@property (nonatomic,assign) BOOL isUp;


@end
