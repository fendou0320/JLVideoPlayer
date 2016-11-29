//
//  ColumnAdCollectionViewCell.m
//  cbox  广告cell
//
//  Created by 王江亮 on 16/7/1.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import "ColumnAdCollectionViewCell.h"

static NSString *adIdentity = @"ColumnAdCollectionViewCell";

@interface ColumnAdCollectionViewCell ()
@property (nonatomic, weak) UIImageView *bigImageView;//左边大图
@property (nonatomic, weak) UILabel *upTitleLabel;//上部标题
@property (nonatomic, weak) UILabel *markLabel;//推广
@end

@implementation ColumnAdCollectionViewCell

+ (instancetype)ColumnAdCollectionViewCell: (UICollectionView *)collectionView indexpath: (NSIndexPath *)indexpath{

    ColumnAdCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:adIdentity forIndexPath:indexpath];
    return cell;
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
    bigImageView.image = [UIImage imageNamed:@"456x342--综艺首页轮播图左侧小图.png"];
    self.bigImageView = bigImageView;
    [self.contentView addSubview:bigImageView];
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
    //    NSString *str = @"皑如山上雪皎若云间月闻君有";
    //    upTitleLabel.text = str;
    //    upTitleLabel.backgroundColor = [UIColor redColor];
    upTitleLabel.numberOfLines = 4;
    //    //调整行间距
    //    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    //    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //    [paragraphStyle setLineSpacing:1.01f]; //调整行间距
    //    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
    //    upTitleLabel.attributedText = attributedString;
    ////    [upTitleLabel sizeToFit];
    //传递
    self.upTitleLabel = upTitleLabel;
    [self.contentView addSubview:upTitleLabel];
    [upTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).mas_offset(5);
        make.left.equalTo(bigImageView.mas_right).mas_offset(8);
        make.right.equalTo(self);
//        make.height.mas_equalTo(80);//行间距调整
    }];
    
    //推广标签
    UILabel *markLabel = [[UILabel alloc]init];
    markLabel.font = [UIFont systemFontOfSize:12.0];
    markLabel.textAlignment = NSTextAlignmentCenter;
    markLabel.textColor = HEX2RGB(@"#0083cd");
    markLabel.layer.borderColor = HEX2RGB(@"#0083cd").CGColor;
    markLabel.layer.borderWidth = 1;
    markLabel.numberOfLines =1;
    markLabel.text = @"广告";//@"推广";
    self.markLabel = markLabel;
    [self.contentView addSubview:markLabel];
    [markLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).mas_offset(-5);//改
        make.right.equalTo(self).mas_offset(-5);//改
        make.width.mas_equalTo(32);
        make.height.mas_equalTo(16);
    }];
    
//    UILabel *tipLabel = [[UILabel alloc]init];
//    self.tipLabel = tipLabel;
//    [self.contentView addSubview:tipLabel];
//    tipLabel.textColor = [UIColor blueColor];
//    tipLabel.layer.borderColor = [UIColor blueColor].CGColor;
//    tipLabel.layer.borderWidth = 1;
//    tipLabel.font = [UIFont systemFontOfSize:12];
//    
//    [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self).with.offset(-5);
//        make.right.equalTo(self).with.offset(-5);
//        make.height.mas_equalTo(16);
//    }];

    
}

//- (void)setModel:(CategoryItemMode *)model{
//    
//    _model = model;
//    //赋值
//    if (model.imgUrl == nil) {
//    }else{
//        [self.bigImageView setImageWithURL:[NSURL URLWithString:model.imgUrl]];
//    }
//    
//    if (model.title == nil) {
//        self.upTitleLabel.hidden = YES;
//    }else{
//        self.upTitleLabel.hidden = NO;
//        self.upTitleLabel.text = model.title;
//    }
//    
//}

- (void)setModel:(AdvertisementModel *)model{

    _model = model;
    
    //赋值
    if (model.url == nil) {
    }else{
        [self.bigImageView setImageWithURL:[NSURL URLWithString:model.url]];
    }

    if (model.text == nil) {
        self.upTitleLabel.hidden = YES;
    }else{
        self.upTitleLabel.hidden = NO;
        self.upTitleLabel.text = model.text;
    }
    
}

    

@end
