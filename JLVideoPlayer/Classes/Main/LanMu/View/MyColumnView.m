//
//  MyColumnView.m
//  cbox
//
//  Created by 王江亮 on 16/7/5.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import "MyColumnView.h"

//顶部导航长条高度.
#define KColumnNavagationHeight 52.5
//我的栏目高度
#define kColumnMyColumnHeight (38+34+40)/2

@interface MyColumnView ()

@property (nonatomic, strong) NSMutableArray *myColumndataArray;
@end

@implementation MyColumnView

+ (instancetype)myColumnViewWithFrame: (CGRect)frame delegate: (id<MyColumnViewDelegate>)delegate{
    MyColumnView *view = [[MyColumnView alloc] initWithFrame:frame];
    view.delegate = delegate;
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        // 获取用户是否点击收藏了
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chosenData) name:kFavChanged object:nil];
        
        //添加监听登录状态改变
//        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(chosenData) name:kLoginStatusChanged object:nil];
        
        [self creatSubview];
    }
    return self;
}

- (void)creatSubview{
    
    //创建底部线条
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, kColumnMyColumnHeight-1, self.width, 1)];
    lineView.backgroundColor = HEX2RGB(@"#e9f1f6");
    [self addSubview:lineView];
    
    UIView *smallColumnView = [[UIView alloc] initWithFrame:CGRectMake(0, 12, 180/2, 64/2)];
    smallColumnView.backgroundColor =HEX2RGB(@"#009be5");
    [self addSubview:smallColumnView];
    
    UIButton *columnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    columnBtn.frame = CGRectMake(0, 14/2, 180/2, 34/2);
    [columnBtn setTitle:@"我的栏目" forState:UIControlStateNormal];
    [columnBtn addTarget:self action:@selector(myFavColumn:) forControlEvents:UIControlEventTouchUpInside];
    columnBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [smallColumnView addSubview:columnBtn];
    
    //更多
    UIButton *moreBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.width-(48+26)/2, self.height/2-24/2, 48/2, 48/2)];
    [moreBtn setImage:[UIImage imageNamed:@"icon-更多-副本_p"] forState:UIControlStateNormal];
    [moreBtn addTarget:self action:@selector(myFavColumn:) forControlEvents:UIControlEventTouchUpInside];
    //    moreImageView.backgroundColor = [UIColor redColor];
    [self addSubview:moreBtn];

    //内容视图
    UIView *noDataContentView = [[UIView alloc] init];
    CGRect frame = CGRectMake(smallColumnView.frame.origin.x+smallColumnView.frame.size.width, 0, moreBtn.frame.origin.x - (smallColumnView.frame.origin.x+smallColumnView.frame.size.width), self.height);
    noDataContentView.frame = frame;
    [self addSubview:noDataContentView];
    self.noDataContentView = noDataContentView;
    self.noDataContentView.hidden = YES;
//    self.noDataContentView.backgroundColor = [UIColor redColor];
    
    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 19, 120+2, 17)];
    //    leftLabel.backgroundColor = [UIColor redColor];
    leftLabel.textColor= HEX2RGB(@"#7794ac");
    leftLabel.font = [UIFont systemFontOfSize:17.0f];
    leftLabel.textAlignment = NSTextAlignmentLeft;
    leftLabel.text = @"暂无收藏栏目。";
    [noDataContentView addSubview:leftLabel];
    
    //登录
    UIButton *landingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [landingBtn setExclusiveTouch:YES];
    landingBtn.frame = CGRectMake(leftLabel.frame.origin.x+leftLabel.frame.size.width, 19, 50, 17);
//    landingBtn.backgroundColor = [UIColor purpleColor];
//    [landingBtn setTitle:@"登录" forState:UIControlStateNormal];
    [landingBtn addTarget:self action:@selector(landingAction:) forControlEvents:UIControlEventTouchUpInside];
    landingBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [noDataContentView addSubview:landingBtn];
//    NSString *oldStr = @"登录";
    //下划线
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@"登录"];
    NSRange titleRange = {0,[title length]};
    [title addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:titleRange];
    [title addAttribute:NSForegroundColorAttributeName value:HEX2RGB(@"#009be5") range:titleRange];
    [title addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17.0f] range:titleRange];
    [landingBtn setAttributedTitle:title
                      forState:UIControlStateNormal];
//    [landingBtn.titleLabel setFont:[UIFont systemFontOfSize:17.0f]];
//    [landingBtn setTintColor:HEX2RGB(@"#009be5")];

//    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
//    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:oldStr attributes:attribtDic];
//    landingBtn.titleLabel.attributedText = attribtStr;
    
    
    UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(landingBtn.frame.origin.x+landingBtn.frame.size.width, 19, 300, 17)];
    //    rightLabel.backgroundColor = [UIColor greenColor];
    rightLabel.textColor= HEX2RGB(@"#7794ac");
    rightLabel.font = [UIFont systemFontOfSize:17.0f];
    rightLabel.textAlignment = NSTextAlignmentLeft;
    rightLabel.text = @"后可多终端同步您的收藏。";
    [noDataContentView addSubview:rightLabel];
    
    //创建有数据视图
    UIView *haveDataContentView = [[UIView alloc] init];
    CGRect frame1 = CGRectMake(smallColumnView.frame.origin.x+smallColumnView.frame.size.width, 0, moreBtn.frame.origin.x - (smallColumnView.frame.origin.x+smallColumnView.frame.size.width-20)-25, self.height);
//    haveDataContentView.backgroundColor = [UIColor greenColor];
    haveDataContentView.frame = frame1;
    [self addSubview:haveDataContentView];
    self.haveDataContentView = haveDataContentView;
    self.haveDataContentView.hidden = YES;
//    self.haveDataContentView.backgroundColor = [UIColor greenColor];
}

#pragma mark - 跳转到我的栏目收藏页
- (void)myFavColumn: (UIButton *)sender{
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"goCollection" object:self];
    //    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"goCollection"];
    //保存
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:@"MyColumn" forKey:@"MyColumn"];
    [defaults synchronize];
    //跳转
    [[AppDelegate sharedInstance].mainViewController setCustomSelectedIndex:4];
}

#pragma mark - 登录
- (void)landingAction: (UIButton *)sender{
    
    NSLog(@"登录");
    //登录
    [LoginSmallViewController showLogin];
//    [self chosenData];
}

//- (void)setMyColumndataArray:(NSMutableArray *)myColumndataArray{
//
//    _myColumndataArray = myColumndataArray;
////    [self haveMyColumnData];
//}

- (void)haveMyColumnData{

    //移除
    for (UIView *view in self.haveDataContentView.subviews) {
        [view removeFromSuperview];
    }
    //再添加
    CGFloat w = 0;
    CGFloat h = 32/2;
    CGFloat x = 20;
    CGFloat y = (self.height - h)/2;
    
    NSInteger favIndex = (self.myColumndataArray.count >4)?4:self.myColumndataArray.count;
//    for (int i = 0; i < self.myColumndataArray.count; i++) {
    for (int i = 0; i < favIndex; i++) {
         FavModel *mode = self.myColumndataArray[i];
        
//        //设置字体大小
        NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:16.0f]};
        w = [mode.title boundingRectWithSize:CGSizeMake(1000, h) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size.width;
        
//        w = [mode.title stringWidthFont:16.0f];
        
        //判断是否超出界面
        if (x+w > self.haveDataContentView.width) {
            return;
        }
        UIButton *label = [[UIButton alloc] init];
        label.tag = i;
        label.frame = CGRectMake(x, y, w, h);
        [label setTitle:mode.title forState:UIControlStateNormal];
        label.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [label setTitleColor:HEX2RGB(@"7794ac") forState:UIControlStateNormal];
        [label addTarget:self action:@selector(columnClick:) forControlEvents:UIControlEventTouchUpInside];
//        label.font = [UIFont systemFontOfSize:16.0f];
//        label.text = mode.title;
//        label.textColor = HEX2RGB(@"7794ac");
        [self.haveDataContentView addSubview:label];
        x += 112/2 + w;
    }
}

#pragma mark - 收到收藏新栏目的通知  －－－获取本地存储的数据
- (void)chosenData{

    NSMutableArray *favArray = [FavModel getFavs];
    [self.myColumndataArray removeAllObjects];
    
    for (FavModel *model in favArray) {
        
        if (model.favType == FavType_Dianbo){
//            if(model.field != nil && ![model.field isEqualToString:@"(null)"]){
//                
//                [self.myColumndataArray addObject:model];
//            }
            if([model.field isEqualToString:@"1"]){
                [self.myColumndataArray addObject:model];
            }
        }
    }
    
    if (self.myColumndataArray.count == 0) {
        
        if([UserAccount isLogined]){
            self.noDataContentView.hidden = YES;
            self.haveDataContentView.hidden = NO;
        }else{
            self.noDataContentView.hidden = NO;
            self.haveDataContentView.hidden = YES;
        }
        
        [self haveMyColumnData];

    }else{
        if([UserAccount isLogined]){
            
            self.noDataContentView.hidden = YES;
            self.haveDataContentView.hidden = NO;
            [self haveMyColumnData];
            
        }else{
            self.noDataContentView.hidden = YES;
            self.haveDataContentView.hidden = NO;
            [self haveMyColumnData];
        }
    }
    
//    if ([UserAccount isLogined]) {
//        self.noDataContentView.hidden = YES;
//        self.haveDataContentView.hidden = NO;
//        [self haveMyColumnData];
//    }else{
//        self.myColumndataArray = [FavModel getFavs];
//        if (self.myColumndataArray.count == 0) {
//            self.noDataContentView.hidden = NO;
//            self.haveDataContentView.hidden = YES;
//        }else{
//            self.noDataContentView.hidden = NO;
//            self.haveDataContentView.hidden = YES;
//        }
//    }
}

////登录状态改变
//- (void)isLoginState{
//
//     chosenData
//
//}


- (void)dealloc{

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(NSMutableArray *)myColumndataArray{

    if (_myColumndataArray==nil) {
        _myColumndataArray = [[NSMutableArray alloc] init];
    }
    return _myColumndataArray;
}


- (void)columnClick: (UIButton *)btn{

    NSInteger index = btn.tag;
    FavModel *mode = self.myColumndataArray[index];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:mode forKey:@"myColunnClick"];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"myColunnClick" object:nil userInfo:dic];
}


@end
