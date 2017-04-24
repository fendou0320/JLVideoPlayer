//
//  LanMuViewController.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/10/18.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "LanMuViewController.h"

//顶部导航长条高度.
#define KColumnNavagationHeight 52.5
//我的栏目高度
#define kColumnMyColumnHeight (38+34+40)/2
//筛选层高度
#define kFilterColumnHeight 128

@implementation LanMuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self creatData];
//    
//    [self creatContentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 创建内容视图
- (void)creatContentView{
    
    //创建精选内容视图
    self.contentview = [ChosenCollectionView chosenCollectionViewWithFrame:CGRectMake(0, KColumnNavagationHeight,  self.view.frame.size.width, self.view.bounds.size.height - KColumnNavagationHeight) delegate:self];
    self.contentview.viewModel = self.viewModel;
     [self.view addSubview:self.contentview];
    
}

#pragma mark - 请求数据
- (void)creatData{
    
    self.viewModel = [ColumnViewModel viewModel];
    
    [self.viewModel columnDataWithSuccess:^(id responds) {
        
        //数据成功 赋值
        self.contentview.viewModel = self.viewModel;
        self.contentview.dataArr = self.viewModel.choosenItemList;
 
    } failBlock:^(NSError *error) {
 
    }];
}

#pragma mark - ChosenCollectionViewDelegate的代理方法 ---点击播放
- (void)chosenCollectionView:(ChosenCollectionView *)selfView didSelectItem:(NSInteger)didItem{
    
//    CategoryItemMode *model = selfView.dataArr[didItem];
//    
//    PlayModel *pm = [[PlayModel alloc]init];
//    pm.playType = PlayType_Dianbo;
//    pm.dianboPlayModel.vsid = model.vsetId;
//    pm.dianboPlayModel.vsetPageid = model.vsetPageid;
//    pm.dianboPlayModel.vType = @"2";
//    pm.dianboPlayModel.columnSo = [model.columnSo intValue];
//    pm.dianboPlayModel.videoImgUrl = model.imgUrl;
//    pm.dianboPlayModel.cid = CID_DIANSHILANMU;
//    pm.dianboPlayModel.adId = @"";
//    pm.dianboPlayModel.listUrl = model.listUrl;
//    
//    pm.wch = [NSString stringWithFormat:@"点播~%@~~~",model.title];
//    
//    [DianboPlayViewController playWithModel:pm nav:self.navigationController anim:YES];
}

@end
