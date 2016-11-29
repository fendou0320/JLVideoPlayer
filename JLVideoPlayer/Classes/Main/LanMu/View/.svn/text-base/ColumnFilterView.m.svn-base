//
//  ColumnFilterView.m
//  cbox
//
//  Created by 王江亮 on 16/7/4.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import "ColumnFilterView.h"

@interface ColumnFilterView ()
@property (nonatomic, strong) ColumnBaseButton *firstLastBtn;
@property (nonatomic, strong) ColumnBaseButton *secondLastBtn;
@property (nonatomic, strong) ColumnBaseButton *thirdLastBtn;
@property (nonatomic, strong) ColumnBaseButton *fourLastBtn;
//存放第一栏数据
@property (nonatomic, strong) NSMutableArray *firstArr;
@property (nonatomic, strong) NSMutableArray *secondArr;
@property (nonatomic, strong) NSMutableArray *thirdArr;
@end

@implementation ColumnFilterView{
    NSInteger popViewHeight; //筛选小窗口高度
}

+ (instancetype)columnFilterViewWithFrame: (CGRect)frame delegate: (id<ColumnFilterViewDelagate>)delegate{
    
    ColumnFilterView *view = [[ColumnFilterView alloc] initWithFrame:frame];
    view.delegate = delegate;
    return view;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.backgroundColor =HEX2RGB(@"#f3f9fe");
//        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)creatSubview{
    
    popViewHeight = 20 + self.filterData.count * 36;
    NSInteger  listY = 20;
    
    for (int i=0;i < self.filterData.count;i++){
        
        FilterItem *data =[self.filterData objectAtIndex:i];
        NSInteger height = 16;
        
        UIView *view =[[UIView alloc] initWithFrame:CGRectMake(0,listY,ScreenWidth,height)];
        
        
//        NSInteger labelHeight = [data.title stringWidthFont:16.0f]+5;
//        UILabel * typeLable =[[UILabel alloc] init];
//        typeLable.text = [data.title stringByAppendingString:@":"];
//        typeLable.frame = CGRectMake(0, 0, labelHeight, height);
//        typeLable.textColor =HEX2RGB(@"#666666");
//        typeLable.font = [UIFont systemFontOfSize:16];
//        typeLable.textAlignment = NSTextAlignmentLeft;
//        [view addSubview:typeLable];
        
        UIScrollView *scrollView =[[UIScrollView alloc] initWithFrame:CGRectMake(0,0,view.frame.size.width,height)];
//        scrollView.backgroundColor = [UIColor greenColor];
        scrollView.tag = 101;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        
        CGFloat btnX = 20;
        
        for(NSInteger j =0 ; j<data.items.count;  j++){
            
            FilterItemBody* itemData = [data.items objectAtIndex : j];
            
//            btnX = ;
            CGFloat btnWidth = [itemData.title stringWidthFont:16.0f]+5;

            ColumnBaseButton *btn =[[ColumnBaseButton alloc ] init];
            btn.frame = CGRectMake(btnX, 0, btnWidth, height);
            btn.rowOfBtn = i;
            btn.type = data.type;
            btn.columnOfBtn = j;
            btn.model = itemData;
            [btn addTarget:self action:@selector(filterPopViewItemClick:) forControlEvents:UIControlEventTouchUpInside];
            btnX = btnX + btnWidth + 20;
            
            //默认选择第一项全部
//            if (j == 0  && [itemData.title isEqualToString:@"全部类型"]){
            if (j == 0){

                btn.selected = YES;
                //分栏
                if (i == 0) {
                    self.firstLastBtn = btn;
                }else if (i == 1){
                    self.secondLastBtn = btn;
                }else if (i == 2){
                    self.thirdLastBtn = btn;
                }else if (i == 3){
                    self.fourLastBtn = btn;
                }
            }
            //存放第一栏
            if (i == 0) {
                [self.firstArr addObject:btn];
            }else if (i == 1){
                [self.secondArr addObject:btn];
            }else if (i == 2){
                [self.thirdArr addObject:btn];
            }
            [scrollView addSubview:btn];
        }
        
        scrollView.contentSize = CGSizeMake(btnX, height);
        
        [view addSubview:scrollView];
        [self addSubview:view];
        //高度累加
        listY = listY + height + 20;
    }
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, popViewHeight - 1 , self.frame.size.width, 1)];
    lineView.tag = 10 + self.filterData.count;
    lineView.backgroundColor = HEX2RGB(@"#bdd3e0");
    [self addSubview:lineView];
}

- (void)setFilterData:(NSArray *)filterData{
    
    _filterData = filterData;
    [self creatSubview];
}

#pragma mark - 点击三维数据
- (void)filterPopViewItemClick: (ColumnBaseButton *)sender{
 
    if (sender.rowOfBtn == 0) {
        if ([self.firstLastBtn isEqual:sender]) {
            return;
        }
        sender.selected = YES;
        self.firstLastBtn.selected = NO;
        self.firstLastBtn = sender;
    }else if (sender.rowOfBtn == 1){
        if ([self.secondLastBtn isEqual:sender]) {
            return;
        }
        sender.selected = YES;
        self.secondLastBtn.selected = NO;
        self.secondLastBtn = sender;
    }else if (sender.rowOfBtn == 2){
        if ([self.thirdLastBtn isEqual:sender]) {
            return;
        }
        sender.selected = YES;
        self.thirdLastBtn.selected = NO;
        self.thirdLastBtn = sender;
    }else if (sender.rowOfBtn == 3){
        if ([self.fourLastBtn isEqual:sender]) {
            return;
        }
        sender.selected = YES;
        self.fourLastBtn.selected = NO;
        self.fourLastBtn = sender;
    }
    
    if ([self.delegate respondsToSelector:@selector(columnFilterView:firstSelectBtn:secondSelectBtn:thirdSelectBtn:)]) {
        [self.delegate columnFilterView:self firstSelectBtn:self.firstLastBtn secondSelectBtn:self.secondLastBtn thirdSelectBtn:self.thirdLastBtn];
    }
}

- (void)changeSelectRowBtn: (NSInteger)rowBtn columnBtn: (NSInteger)columnBtn{

    if (rowBtn == 0) {
        ColumnBaseButton *firstBtn = self.firstArr[columnBtn];
        if ([self.firstLastBtn isEqual:firstBtn]) {
        }else{
            firstBtn.selected = YES;
            self.firstLastBtn.selected = NO;
            self.firstLastBtn = firstBtn;
        }
    }else if (rowBtn == 1){
        ColumnBaseButton *secondBtn = self.secondArr[columnBtn];
        if ([self.secondLastBtn isEqual:secondBtn]) {
        }else{
            secondBtn.selected = YES;
            self.secondLastBtn.selected = NO;
            self.secondLastBtn = secondBtn;
        }
    }else if (rowBtn == 3){
        ColumnBaseButton *thirdBtn = self.thirdArr[columnBtn];
        if ([self.thirdLastBtn isEqual:thirdBtn]) {
        }else{
            thirdBtn.selected = YES;
            self.thirdLastBtn.selected = NO;
            self.thirdLastBtn = thirdBtn;
        }
    }
    
    if ([self.delegate respondsToSelector:@selector(columnFilterView:firstSelectBtn:secondSelectBtn:thirdSelectBtn:)]) {
        [self.delegate columnFilterView:self firstSelectBtn:self.firstLastBtn secondSelectBtn:self.secondLastBtn thirdSelectBtn:self.thirdLastBtn];
    }
}

#pragma mark - 懒加载
- (NSMutableArray *)firstArr{

    if (_firstArr == nil) {
        _firstArr = [[NSMutableArray alloc] init];
    }
    return _firstArr;
}

- (NSMutableArray *)secondArr{

    if (_secondArr == nil) {
        _secondArr = [[NSMutableArray alloc] init];
    }
    return _secondArr;
}

- (NSMutableArray *)thirdArr{

    if (_thirdArr == nil) {
        _thirdArr = [[NSMutableArray alloc] init];
    }
    return _thirdArr;
}


- (ColumnBaseButton *)firstLastBtn{

    if (_firstLastBtn == nil) {
        _firstLastBtn = [[ColumnBaseButton alloc] init];
    }
    return _firstLastBtn;
}

- (ColumnBaseButton *)secondLastBtn{
    
    if (_secondLastBtn == nil) {
        _secondLastBtn = [[ColumnBaseButton alloc] init];
    }
    return _secondLastBtn;
}

- (ColumnBaseButton *)thirdLastBtn{
    
    if (_thirdLastBtn == nil) {
        _thirdLastBtn = [[ColumnBaseButton alloc] init];
    }
    return _thirdLastBtn;
}

- (ColumnBaseButton *)fourLastBtn{
    
    if (_fourLastBtn == nil) {
        _fourLastBtn = [[ColumnBaseButton alloc] init];
    }
    return _fourLastBtn;
}




@end
