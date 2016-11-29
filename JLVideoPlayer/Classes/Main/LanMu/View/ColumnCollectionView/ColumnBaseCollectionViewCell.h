//
//  ColumnBaseCollectionViewCell.h
//  cbox
//
//  Created by 王江亮 on 16/7/3.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColumnChannelModel.h"

@interface ColumnBaseCollectionViewCell : UICollectionViewCell

+ (instancetype)ColumnBaseCollectionViewCell: (UICollectionView *)collectionView indexpath: (NSIndexPath *)indexpath;

@property (nonatomic, strong) ColumnChannelModel *model;

@end
