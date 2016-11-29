//
//  SportsCollectionViewCell.h
//  cbox
//
//  Created by 朝阳 on 16/5/6.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterListItem7PE.h"

@interface SportsCollectionViewCell : UICollectionViewCell

+ (instancetype)sportsCollectionView: (UICollectionView *)collectionView indexpath: (NSIndexPath *)indexpath;

@property (nonatomic, strong) FilterListItem7PE *itemData;

@end
