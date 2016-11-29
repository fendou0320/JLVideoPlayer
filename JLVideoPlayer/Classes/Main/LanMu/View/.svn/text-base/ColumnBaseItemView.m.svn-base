//
//  ColumnBaseItemView.m
//  cbox
//
//  Created by 王江亮 on 16/6/30.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import "ColumnBaseItemView.h"

@interface ColumnBaseItemView ()
@property (nonatomic, weak) UIImageView *bigImageView;//左边大图
@property (nonatomic, weak) UILabel *upTitleLabel;//上部标题
@property (nonatomic, weak) UILabel *downTitleLabel;//下部标题
@property (nonatomic, weak) UILabel *markLabel;//右侧时间
@property (nonatomic, weak) UIImageView *starImageView;//左边大图
@end

@implementation ColumnBaseItemView

+ (instancetype)columnBaseItemViewWithFrame: (CGRect)frame{

    ColumnBaseItemView *view = [[ColumnBaseItemView alloc] initWithFrame:frame];
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = HEX2RGB(@"#f2f2f2");
        [self creatSubview];
    }
    return self;
}

- (void)creatSubview{

    //图片bigImageView
    UIImageView *bigImageView = [[UIImageView alloc]init];
    bigImageView.contentMode = UIViewContentModeScaleToFill;
    self.bigImageView = bigImageView;
    [self addSubview:bigImageView];
    [bigImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.width.mas_equalTo(320/2);
        make.height.mas_equalTo(240/2);
    }];
    
    //标题titleLabel
    UILabel *upTitleLabel = [[UILabel alloc]init];
    upTitleLabel.font = [UIFont systemFontOfSize:16.0];
    upTitleLabel.textColor = HEX2RGB(@"#000000");
    upTitleLabel.numberOfLines =4;
    self.upTitleLabel = upTitleLabel;
    [self addSubview:upTitleLabel];
    [upTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);//改
        make.left.equalTo(self);//改
        make.width.mas_equalTo(0);
        make.height.mas_equalTo(52/2);
    }];
    
    //下标题
    UILabel *downTitleLabel = [[UILabel alloc]init];
    downTitleLabel.font = [UIFont systemFontOfSize:16.0];
    downTitleLabel.textColor = HEX2RGB(@"#000000");
    downTitleLabel.numberOfLines =4;
    self.downTitleLabel = downTitleLabel;
    [self addSubview:downTitleLabel];
    [downTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);//改
        make.left.equalTo(self);//改
        make.width.mas_equalTo(0);
        make.height.mas_equalTo(52/2);
    }];
    
    //标签
    UILabel *markLabel = [[UILabel alloc]init];
    markLabel.font = [UIFont systemFontOfSize:16.0];
    markLabel.textColor = HEX2RGB(@"#000000");
    markLabel.numberOfLines =1;
    markLabel.text = @"已收藏";
    self.markLabel = markLabel;
    [self addSubview:markLabel];
    [markLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);//改
        make.left.equalTo(self);//改
        make.width.mas_equalTo(0);
        make.height.mas_equalTo(52/2);
    }];

    //图片bigImageView
    UIImageView *starImageView = [[UIImageView alloc]init];
    starImageView.contentMode = UIViewContentModeScaleToFill;
    self.starImageView = starImageView;
    [self addSubview:starImageView];
    [starImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.width.mas_equalTo(0);
        make.height.mas_equalTo(self.height - 3);
    }];
}


@end
