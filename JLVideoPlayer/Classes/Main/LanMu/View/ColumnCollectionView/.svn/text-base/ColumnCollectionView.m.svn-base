//
//  ColumnCollectionView.m
//  cbox
//
//  Created by 王江亮 on 16/7/3.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import "ColumnCollectionView.h"

static NSString *columnentity = @"ColumnBaseCollectionViewCell";

@implementation ColumnCollectionView

+ (instancetype)columnCollectionViewWithFrame: (CGRect)frame delegate: (id<ColumnCollectionViewDelegate>) delegate{

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake((frame.size.width-42)/3, 120);
    //垂直间距 经过计算得出
    layout.minimumLineSpacing = 20;
    //水平间距
    layout.minimumInteritemSpacing = 21;
    
    ColumnCollectionView *view = [[ColumnCollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    view.backgroundColor = COLOR_COMMON_BG;
    view.contentInset = UIEdgeInsetsMake(0, 0, 17, 0);
    view.columnDelegate = delegate;
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = COLOR_COMMON_BG;
        self.showsVerticalScrollIndicator = NO;
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[ColumnBaseCollectionViewCell class] forCellWithReuseIdentifier:columnentity];
        //注册头
        [self registerClass:[UICollectionReusableView class]  forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.dataArr.count > 0) {
        return self.dataArr.count;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    ColumnBaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:columnentity forIndexPath:indexPath];
    if (indexPath.row <= self.dataArr.count) {
        ColumnChannelModel *model = self.dataArr[indexPath.row];
        cell.model = model;
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    NSInteger item = indexPath.row;
    if ([self.columnDelegate respondsToSelector:@selector(columnCollectionView:didSelectItem:)]) {
        [self.columnDelegate columnCollectionView:self didSelectItem:item];
    }
}

- (void)setDataArr:(NSMutableArray *)dataArr{

    _dataArr = dataArr;
    [self reloadData];
}

//设置头视图
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader){
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head" forIndexPath:indexPath];
        reusableview = headerView;
    }
    return reusableview;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return CGSizeMake(ScreenWidth, 17);
}


@end
