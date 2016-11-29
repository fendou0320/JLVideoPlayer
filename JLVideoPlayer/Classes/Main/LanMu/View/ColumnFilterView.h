//
//  ColumnFilterView.h
//  cbox
//
//  Created by 王江亮 on 16/7/4.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColumnBaseButton.h"

@class ColumnFilterView;

@protocol ColumnFilterViewDelagate <NSObject>
/**
 *  点击回传
 *
 *  @param selfView
 *  @param firstBtn  点击的第一维数据
 *  @param secondBtn 点击的第二维数据
 *  @param thirdBtn  点击的第三维数据
 */
- (void)columnFilterView: (UIView *)selfView firstSelectBtn : (ColumnBaseButton *)firstBtn secondSelectBtn : (ColumnBaseButton *)secondBtn thirdSelectBtn : (ColumnBaseButton *)thirdBtn;
@end

@interface ColumnFilterView : UIView

/**
 *  三维筛选视图
 *
 *  @param frame    frame
 *  @param delegate
 *
 *  @return self
 */
+ (instancetype)columnFilterViewWithFrame: (CGRect)frame delegate: (id<ColumnFilterViewDelagate>)delegate;
/**
 *  进入控制器默认的选择
 *
 *  @param rowBtn     栏数
 *  @param columnBtn  行数
 */
- (void)changeSelectRowBtn: (NSInteger)rowBtn columnBtn: (NSInteger)columnBtn;
/**
 *  代理方法
 */
@property (nonatomic, weak) id<ColumnFilterViewDelagate> delegate;
/**
 *  筛选数据
 */
@property (nonatomic, strong) NSArray *filterData;



@end
