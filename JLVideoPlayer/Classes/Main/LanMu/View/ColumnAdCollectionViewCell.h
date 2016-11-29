//
//  ColumnAdCollectionViewCell.h
//  cbox
//
//  Created by 王江亮 on 16/7/1.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ColumnChosenModel.h"

@interface ColumnAdCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) AdvertisementModel *model;

+ (instancetype)ColumnAdCollectionViewCell: (UICollectionView *)collectionView indexpath: (NSIndexPath *)indexpath;

@end
