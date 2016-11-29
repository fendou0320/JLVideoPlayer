//
//  ColumnBannerView.m
//  cbox
//
//  Created by 王江亮 on 16/7/18.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import "ColumnBannerView.h"

@interface ColumnBannerView ()
//轮播图
@property (nonatomic, strong) ZhuantiBanner *bigBanner;
@end

@implementation ColumnBannerView

+ (instancetype)ColumnBannerViewWithFrame:(CGRect)frame Delegate:(id<ColumnBannerViewDelegate>)delegate{
    
    ColumnBannerView *view = [[self alloc] initWithFrame:frame];
    view.bannerDelegate = delegate;
    return view;
}


- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
//        //即时刷新
//        lastLivingRefreshTime= [NSDate date];
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshLivingEpg) name:UITIMER_TICK object:nil];
//        
//        self.bigImageArray = bigImageArray;
//        self.type2ModelArray = type2ModelArray;
//        self.pageBaseModel = model;
//        self.myType = myType;
        [self creatBigImage];
//        [self creatRightView];
    }
    return self;
}

//- (void)dealloc{
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITIMER_TICK object:nil];
//}

- (void)creatBigImage{
    
    //大图轮播
    if (_bigBanner) {
        _bigBanner.delegate = nil;
        _bigBanner = nil;
    }
    
    self.bigBanner = [[ZhuantiBanner alloc] init];//WithFrame:CGRectMake(0, 0, 1390/2, 780/2)];
    NSMutableArray *imgArray = [[NSMutableArray alloc]initWithCapacity:5];
    NSMutableArray *titleArray = [[NSMutableArray alloc]initWithCapacity:5];
    NSMutableArray *colorArray = [[NSMutableArray alloc]initWithCapacity:5];
    NSInteger count = _bigImageArray.count > 8 ? 8 : (_bigImageArray.count);//最大是8
    for(NSInteger i = 0 ; i < count ; ++i){
        BigImgModel *m = [_bigImageArray objectAtIndex:i];
        [imgArray addObject:m.imgUrl];
        [titleArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:m.title,@"title", nil]];
        
        BigImgColorModel * color = [[BigImgColorModel alloc]init];
        color.cornerColour = m.cornerColour;
        color.cornerStr = m.cornerStr;
        [colorArray addObject:color];
    }
    
    [self.bigBanner setBigData:colorArray];
    [self.bigBanner initBillBordWithImageUrl:imgArray ContentNameArray:nil ContentUrlArray:nil PageCtrlStyle:ZHUANTIBANNER_PAGECONTROL_BOTTOM_RIGHT_BACK  AutoScroll:YES TimeInterval:5.0f data:titleArray From:ZHUANTIBANNER_DIANBO];
    
    if(imgArray.count > 1){
        [self.bigBanner setPageControlHide:NO];
    }else{
        [self.bigBanner setPageControlHide:YES];
    }
    imgArray = nil;
    titleArray = nil;
    self.bigBanner.delegate = self;
    [self addSubview:self.bigBanner];
}


#pragma mark - 轮播图的代理方法
- (void)OnSpecialBannerTouched:(NSString *)sUrl;{
    
}

- (void)OnSpecialBannerPageChange:(int)index view:(id)sender{
    
}

- (void)OnSpecialBannerTouchedByIndex:(int)index view:(id)sender{
    
    if ([self.bannerDelegate respondsToSelector:@selector(columnBannerView:OnSpecialBannerPageChange:view:)]) {
        [self.bannerDelegate columnBannerView:self OnSpecialBannerPageChange:index view:sender];
    }
}




@end
