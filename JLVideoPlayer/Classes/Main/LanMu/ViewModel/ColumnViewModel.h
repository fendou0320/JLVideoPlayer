//
//  ColumnViewModel.h
//  cbox
//
//  Created by 王江亮 on 16/6/30.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "ColumnChosenModel.h"
#import "ColumnChannelModel.h"

@interface ColumnViewModel : NSObject
//精选数据
@property (nonatomic, strong) NSMutableArray *choosenItemList;
@property (nonatomic, strong) NSMutableArray *secondModelArray;
//@property (nonatomic, strong) NSMutableArray *choosenADArray;
//筛选接口
@property (nonatomic, assign) NSString *filterUrl;
//筛选三维数据---装好model－－－CategoryListModel类型
@property (nonatomic, strong) NSMutableArray *filterData;
//筛选三维数据---未装model
@property (nonatomic, strong) NSMutableArray *filterResponds;
//频道数据
@property (nonatomic, strong) NSMutableArray *channelData;

//缓存精选的二次数据
@property (nonatomic, strong) NSMutableDictionary *chosenSecondDic;

+ (instancetype)viewModel;

- (void)columnDataWithSuccess:(SuccessBlock)successBlock failBlock:(FailureBlock)failBlock;
- (void)filterDataWithSuccess:(SuccessBlock)successBlock failBlock:(FailureBlock)failBlock;
/**
 *  广告数据请求
 *
 *  @param successBlock success
 *  @param failBlock    fail
 */
- (void)columnChosenADdataWithSuccess:(SuccessBlock)successBlock failBlock:(FailureBlock)failBlock;
//首页各频道点击获取数据
- (void)columnChannelWithSuccess:(SuccessBlock)successBlock failBlock:(FailureBlock)failBlock categoryModelStr: (NSString *)categoryStr channelPage:(NSInteger)channelPage;
- (void)cancelAllRequest;

- (void)secondChosenDataWithSuccess:(SuccessBlock)successBlock failBlock:(FailureBlock)failBlock;


@end
