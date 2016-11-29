//
//  SportsCollectionView.m
//  cbox
//
//  Created by 朝阳 on 16/4/22.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import "SportsCollectionView.h"
#import "SportsCollectionViewCell.h"
#import "EightCtrCollectionViewCell.h"

static NSString *CellIdentifierSeven = @"SportsCollectionViewCell";
static NSString *CellIdentifierEight = @"EightCtrCollectionViewCell";

@interface SportsCollectionView ()
//判断是第七或是第八控制器的cell
@property (nonatomic, assign) SportCollectionCellType cellType;
@end

@implementation SportsCollectionView

+ (instancetype)sportCollectionView: (CGRect)frame withCellType: (SportCollectionCellType)type withDelegate:(id<sportCollectionViewDelegate>)sportDelegate{

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    if (type == SportCollectionCellTypeSeven) {
        layout.itemSize = CGSizeMake(228, 187);
        layout.minimumLineSpacing = 20;
    }else if (type == SportCollectionCellTypeEight){
        layout.itemSize = CGSizeMake(144, 205);
        //垂直间距 经过计算得出
        layout.minimumLineSpacing = 15;
        //水平间距
        layout.minimumInteritemSpacing = 24;
    }
    
    SportsCollectionView *view = [[SportsCollectionView alloc] initWithFrame:frame collectionViewLayout:layout cellType:type];
    view.contentInset = UIEdgeInsetsMake(0, 0, 20, 0);
    view.sprotCollectDelegate = sportDelegate;
    return view;
}

- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout cellType: (SportCollectionCellType)type{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        //判断是第七或是第八控制器的cell
        self.cellType = type;
        
        if (type == SportCollectionCellTypeSeven) {
            //注册单元格
            [self registerClass:[SportsCollectionViewCell class] forCellWithReuseIdentifier:CellIdentifierSeven];
        }else if (type == SportCollectionCellTypeEight){
            //注册单元格
            [self registerClass:[EightCtrCollectionViewCell class] forCellWithReuseIdentifier:CellIdentifierEight];
        }
        
    }
    return self;
}

#pragma mark - UICollectionViewDataSource的代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (_data.count > 0) {
        return _data.count;
    }
    return 0;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    if (_cellType == SportCollectionCellTypeSeven) {
        SportsCollectionViewCell *cell = [SportsCollectionViewCell sportsCollectionView:self indexpath:indexPath];
        FilterListItem7PE *itemData =[self.data objectAtIndex:indexPath.row];
        cell.itemData = itemData;
        return cell;
    }else if (_cellType == SportCollectionCellTypeEight){
        EightCtrCollectionViewCell *cell = [EightCtrCollectionViewCell eightCtrCollectionViewCell:self indexpath:indexPath];
        FilterListItem *itemData =[self.data objectAtIndex:indexPath.row];
        cell.itemData = itemData;
        return cell;
    }
    return nil;
}


- (void)setData:(NSMutableArray *)data{
    
    _data = data;
    //刷新数据
    [self reloadData];
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    if ([self.sprotCollectDelegate respondsToSelector:@selector(sportCollectionView:withIndexpath:)]) {
        [self.sprotCollectDelegate sportCollectionView:self withIndexpath:indexPath];
    }
}



@end
