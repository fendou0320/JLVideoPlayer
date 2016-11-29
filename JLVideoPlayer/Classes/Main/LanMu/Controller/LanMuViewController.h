//
//  LanMuViewController.h
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/10/18.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "BaseViewController.h"

#import "ChosenCollectionView.h"
#import "ColumnViewModel.h"

@interface LanMuViewController : BaseViewController<ChosenCollectionViewDelegate>

@property (nonatomic, strong) ColumnViewModel *viewModel;
//精选页面底部视图
@property (nonatomic, strong) ChosenCollectionView *contentview;

@end
