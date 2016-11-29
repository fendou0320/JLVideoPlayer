//
//  ChosenCollectionViewCell.h
//  cbox
//
//  Created by 王江亮 on 16/6/30.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColumnChosenSecondModel.h"
#import "ColumnViewModel.h"
#import "CategoryItemMode.h"

@interface ChosenCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) CategoryItemMode *model;
@property (nonatomic, strong) ColumnChosenSecondModel *secondModel;

+ (instancetype)chosenCollectionViewCell: (UICollectionView *)collectionView indexpath: (NSIndexPath *)indexpath;

//viewModel
@property (nonatomic, strong) ColumnViewModel *viewModel;


@end
