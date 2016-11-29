//
//  EightCtrCollectionViewCell.h
//  cbox
//
//  Created by 朝阳 on 16/6/1.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterListItem.h"

@interface EightCtrCollectionViewCell : UICollectionViewCell

+ (instancetype)eightCtrCollectionViewCell: (UICollectionView *)collectionView indexpath: (NSIndexPath *)indexpath;

@property (nonatomic, strong) FilterListItem *itemData;

@end
