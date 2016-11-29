//
//  RecommendTopFilterView.m
//  cbox
//
//  Created by 王江亮 on 16/7/15.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import "RecommendTopFilterView.h"

@interface RecommendTopFilterView ()
@property (nonatomic, strong) NSMutableArray *btnArray;
@property (nonatomic, strong) ColumnBaseButton *lastBtn;
@end

@implementation RecommendTopFilterView

- (id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor =HEX2RGB(@"#f3f9fe");
//        self.backgroundColor = [UIColor purpleColor];
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 1 , self.frame.size.width, 1)];
        lineView.backgroundColor = HEX2RGB(@"#c2d8e6");
        [self addSubview:lineView];
    }
    return self;
}

- (void)setDataArray:(NSMutableArray *)dataArray{

    _dataArray = dataArray;
    [self creatSubView];
}


- (void)creatSubView{

    //移除
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 1, self.frame.size.width, 1)];
    lineView.backgroundColor = HEX2RGB(@"#bdd3e0");
    [self addSubview:lineView];

    
    FilterItem *model = self.dataArray[0];

//    NSInteger labelHeight = [model.title stringWidthFont:16.0f]+5;
//    UILabel * typeLable =[[UILabel alloc] init];
//    typeLable.text = [model.title stringByAppendingString:@":"];
//    typeLable.frame = CGRectMake(20, 20, labelHeight, 16);
//    typeLable.textColor =HEX2RGB(@"#666666");
//    typeLable.font = [UIFont systemFontOfSize:16];
//    typeLable.textAlignment = NSTextAlignmentLeft;
//    [self addSubview:typeLable];

    
    NSArray *arr = model.items;
    NSInteger btnX = 20;

    UIScrollView *scrollView =[[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, self.width, 16)];
//    scrollView.backgroundColor = [UIColor redColor];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [self addSubview:scrollView];
    
    for (NSInteger i = 0; i < arr.count; i++) {
        
        FilterItemBody *body = arr[i];
        ColumnBaseButton *btn =[[ColumnBaseButton alloc ] init];
//        btn.backgroundColor = [UIColor redColor];
        CGFloat widthX = [body.title stringWidthFont:16.0f]+5;
        btn.frame = CGRectMake(btnX, 0, widthX, 16);
        btn.model = body;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btnX = btnX + widthX + 20;
        [scrollView addSubview:btn];
        scrollView.contentSize = CGSizeMake(btnX, 16);
        [self.btnArray addObject:btn];
    }
}


- (void)btnClick: (ColumnBaseButton *)sender{
  
    self.lastBtn.selected = NO;
    sender.selected = YES;
    self.lastBtn = sender;
    if ([self.filterDelegate respondsToSelector:@selector(recommendTopFilterView:model:)]) {
        [self.filterDelegate recommendTopFilterView:self model:sender];
    }
}


- (void)clickBtn: (NSInteger)index{

    ColumnBaseButton *colbtn = _btnArray[index];
    colbtn.selected = YES;
    self.lastBtn = colbtn;
    [self btnClick:colbtn];
}


- (NSMutableArray *)btnArray{
    
    if (_btnArray == nil) {
        _btnArray = [[NSMutableArray alloc] init];
    }
    return _btnArray;
}

@end
