//
//  RecommendFilterFourCell.h
//  cbox
//
//  Created by 王江亮 on 16/7/15.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  FilterListItem;

@interface RecommendFilterFourCell : UICollectionViewCell

+ (instancetype)recommendFilterFourCell: (UICollectionView *)collectionView indexpath: (NSIndexPath *)indexpath;
@property (nonatomic, strong) FilterListItem7PE *itemData;


@end
