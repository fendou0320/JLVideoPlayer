//
//  ColumnViewModel.m
//  cbox
//
//  Created by 王江亮 on 16/6/30.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import "ColumnViewModel.h"
#import "ColumnChosenSecondModel.h"

@interface ColumnViewModel ()
@property (nonatomic,strong) NSMutableDictionary *dataDic;
@property (nonatomic,strong) NSMutableArray *tagArr;

////精选页书
//@property (nonatomic, assign) NSInteger choosenPage;
////频道页书
//@property (nonatomic, assign) NSInteger channelPage;

@end

@implementation ColumnViewModel{
//    //精选页书
//    NSInteger choosenPage;
//    //频道页书
//    NSInteger channelPage;
    
    //广告url
    NSString* advertisementLinkUrl;
    //是否有广告
    BOOL havaAd;
}


+ (instancetype)viewModel{

    ColumnViewModel *viewModel = [[ColumnViewModel alloc]init];
//    viewModel.choosenPage = 1;
//    viewModel.channelPage = 1;
    return viewModel;
}


@end
