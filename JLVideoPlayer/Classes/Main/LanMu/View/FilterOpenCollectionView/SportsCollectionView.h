//
//  SportsCollectionView.h
//  cbox
//
//  Created by 朝阳 on 16/4/22.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterListItem7PE.h"
@class SportsCollectionView;

typedef enum {
    SportCollectionCellTypeSeven = 7,
    SportCollectionCellTypeEight = 8,
}SportCollectionCellType;


@protocol sportCollectionViewDelegate <NSObject>
@optional
- (void)sportCollectionView : (SportsCollectionView *)collectionView withIndexpath: (NSIndexPath *)indexpath;
@end


@interface SportsCollectionView : UICollectionView<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) id<sportCollectionViewDelegate> sprotCollectDelegate;

+ (instancetype)sportCollectionView: (CGRect)frame withCellType: (SportCollectionCellType)type withDelegate:(id<sportCollectionViewDelegate>)sportDelegate;

@property (nonatomic, strong) NSMutableArray *data;


@end
