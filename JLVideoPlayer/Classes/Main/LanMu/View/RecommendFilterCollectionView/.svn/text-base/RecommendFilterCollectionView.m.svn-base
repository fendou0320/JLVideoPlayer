//
//  RecommendFilterCollectionView.m
//  cbox
//
//  Created by 王江亮 on 16/7/15.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import "RecommendFilterCollectionView.h"
#import "RecommendFilterFourCell.h"
#import "RecommendFilterSixCell.h"
#import "FilterCollectionViewCell.h"

static NSString *CellIdentifierSeven = @"RecommendFilterFourCell";
static NSString *CellIdentifierEight = @"RecommendFilterSixCell";
static NSString *filterIdentifierEight = @"FilterCollectionViewCell";

@interface RecommendFilterCollectionView ()
@property (nonatomic, assign) RecommendFilterCollectionViewType cellType;
@property (nonatomic,assign) CGFloat oldY;
@end

@implementation RecommendFilterCollectionView
+ (instancetype)recommendFilterCollectionView: (CGRect)frame withCellType: (RecommendFilterCollectionViewType)type withDelegate:(id<RecommendFilterCollectionViewDelegate>)filterDelegate{

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    RecommendFilterCollectionView *view = [[RecommendFilterCollectionView alloc] initWithFrame:frame collectionViewLayout:layout cellType:type];

    if (type == RecommendFilterCollectionViewTypeFour) {
        
        layout.itemSize = CGSizeMake((frame.size.width-40-24*3)/4, (342+20+32+6+32)/2);
        //垂直间距 经过计算得出
        layout.minimumLineSpacing = 10;
        //水平间距
        layout.minimumInteritemSpacing = 24;
        view.contentInset = UIEdgeInsetsMake(0, 20, 17, 20);
        view.recommendFilterDelegate = filterDelegate;
        
    }else if (type == RecommendFilterCollectionViewTypeSix){

        layout.itemSize = CGSizeMake((frame.size.width - 40 -24*5)/6, 450/2);
        //垂直间距 经过计算得出
        layout.minimumLineSpacing = 10;
        //水平间距
        layout.minimumInteritemSpacing = 24;
        view.contentInset = UIEdgeInsetsMake(0, 20, 17, 20);
        view.recommendFilterDelegate = filterDelegate;
    }else if(type == RecommendFilterCollectionViewTypeSixLanMU){
        
        layout.itemSize = CGSizeMake((frame.size.width-40-24*3)/4, (342+20+32+6+32)/2);
        //垂直间距 经过计算得出
        layout.minimumLineSpacing = 10;
        //水平间距
        layout.minimumInteritemSpacing = 24;
        view.contentInset = UIEdgeInsetsMake(0, 20, 17, 20);
        view.recommendFilterDelegate = filterDelegate;
  
    }
    return view;
}

- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout cellType: (RecommendFilterCollectionViewType)type{
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = HEX2RGB(@"#f9fcfc");

//        self.bounces = NO;
        
        //判断是横或是竖的cell
        self.cellType = type;
        if (type == RecommendFilterCollectionViewTypeFour) {
            //注册单元格
            [self registerClass:[RecommendFilterFourCell class] forCellWithReuseIdentifier:CellIdentifierSeven];
        }else if (type == RecommendFilterCollectionViewTypeSix){
            //注册单元格
            [self registerClass:[RecommendFilterSixCell class] forCellWithReuseIdentifier:CellIdentifierEight];
            
        }else if (type == RecommendFilterCollectionViewTypeSixLanMU){
        
            [self registerClass:[FilterCollectionViewCell class] forCellWithReuseIdentifier:filterIdentifierEight];
        }
        //注册头
        [self registerClass:[UICollectionReusableView class]  forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
        
    }
    return self;
}


#pragma mark - UICollectionViewDataSource的代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.data.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_cellType == RecommendFilterCollectionViewTypeFour) {
        
        RecommendFilterFourCell *cell = [RecommendFilterFourCell recommendFilterFourCell:self indexpath:indexPath];
        FilterListItem7PE *model =[self.data objectAtIndex:indexPath.row];
        cell.itemData = model;
        return cell;
    }else if (_cellType == RecommendFilterCollectionViewTypeSix){
        
        RecommendFilterSixCell *cell = [RecommendFilterSixCell recommendFilterSixCell:self indexpath:indexPath];
        FilterListItem *model =[self.data objectAtIndex:indexPath.row];
        cell.itemData = model;
        return cell;
    }else if (_cellType == RecommendFilterCollectionViewTypeSixLanMU){
        
        FilterCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:filterIdentifierEight forIndexPath:indexPath];
        ColumnChannelModel *model = [self.data objectAtIndex:indexPath.row];
        cell.model = model;
        return cell;       
    }

    return nil;
}


- (void)setData:(NSMutableArray *)data{
    
    _data = data;
    
    if (_cellType == RecommendFilterCollectionViewTypeSix) {
        
        if ((12 < _data.count)&&(_data.count< 19)) {
            for (NSInteger i = _data.count; i<20; i++) {
                FilterListItem *model = [[FilterListItem alloc] init];
                [_data addObject:model];
            }
        }
    }else if(_cellType == RecommendFilterCollectionViewTypeSixLanMU){
        
        if ((8 < _data.count)&&(_data.count< 13)) {
            for (NSInteger i = _data.count; i<14; i++) {
                ColumnChannelModel *model = [[ColumnChannelModel alloc] init];
                [_data addObject:model];
            }
        }
    }
    //刷新数据
    [self reloadData];
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.recommendFilterDelegate respondsToSelector:@selector(recommendFilterCollectionView:withIndexpath:)]) {
        [self.recommendFilterDelegate recommendFilterCollectionView:self withIndexpath:indexPath];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSLog(@"aaaaa%f", scrollView.bounds.origin.y);
    
    if (scrollView.bounds.origin.y < 0){
        return;
    }
    
    if (self.oldY >= scrollView.bounds.origin.y) {
        self.isUp = NO;//往下滚动
        self.oldY = scrollView.bounds.origin.y;
    }else{
        self.isUp = YES;//向上滚动
        self.oldY = scrollView.bounds.origin.y;
    }
    if ([self.recommendFilterDelegate respondsToSelector:@selector(recommendFilterCollectionView:didScrollToUp:)]) {
        [self.recommendFilterDelegate recommendFilterCollectionView:self didScrollToUp:scrollView];
    }
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
    
    return CGSizeMake(self.frame.size.width, 17);
}

@end
