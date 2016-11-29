//
//  ChosenCollectionView.m
//  cbox
//
//  Created by 王江亮 on 16/6/30.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import "ChosenCollectionView.h"
//我的栏目高度
#define kColumnMyColumnHeight (38+34+40)/2

static NSString *adIdentity = @"ColumnAdCollectionViewCell";
static NSString *identity = @"ChosenCollectionViewCell";
static NSString *headIdentity = @"headCell";

@implementation ChosenCollectionView

+ (instancetype)chosenCollectionViewWithFrame: (CGRect)frame delegate: (id<ChosenCollectionViewDelegate>) delegate{

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake((frame.size.width-42-40)/3, 120);
    //垂直间距 经过计算得出
    layout.minimumLineSpacing = 20;
    //水平间距
    layout.minimumInteritemSpacing = 21;
    //头
//    [layout setHeaderReferenceSize:CGSizeMake(frame.size.width, kColumnMyColumnHeight)];
    
    ChosenCollectionView *view = [[ChosenCollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    view.contentInset = UIEdgeInsetsMake(0, 20, 17, 20);
    view.chooseDelegate = delegate;
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{

    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
         self.showsVerticalScrollIndicator = NO;
        self.delegate = self;
        self.dataSource = self;
        
        
        [self registerClass:[ChosenCollectionViewCell class] forCellWithReuseIdentifier:identity];
        
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.dataArr.count > 0) {
        return self.dataArr.count ;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    id model = self.dataArr[indexPath.row];

    
    if ([model isKindOfClass:[CategoryItemMode class]]) {
    
        ChosenCollectionViewCell *cell = [ChosenCollectionViewCell chosenCollectionViewCell:self indexpath:indexPath];
        //判读有没有第二次数据的值
        if (self.viewModel.secondModelArray.count == 0) {
            
        }else{
            cell.viewModel = self.viewModel;
            if (indexPath.row >= self.viewModel.secondModelArray.count) {
                return cell;
            }
            ColumnChosenSecondModel *secondModel = self.viewModel.secondModelArray[indexPath.row];
            cell.secondModel = secondModel;
            CategoryItemMode *chosenModel = self.dataArr[indexPath.row];
            cell.model = chosenModel;
        }
        return cell;
    }
     return nil;
}

//赋值
- (void)setDataArr:(NSMutableArray *)dataArr{

    _dataArr = dataArr;
    [self reloadData];
}

//向外部传值
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    NSInteger didItem = indexPath.row;
    if ([self.chooseDelegate respondsToSelector:@selector(chosenCollectionView:didSelectItem:)]) {
        [self.chooseDelegate chosenCollectionView:self didSelectItem:didItem];
    }
}

//登录状态改变
- (void)loginStateChange{

    [self reloadData];
}


@end
