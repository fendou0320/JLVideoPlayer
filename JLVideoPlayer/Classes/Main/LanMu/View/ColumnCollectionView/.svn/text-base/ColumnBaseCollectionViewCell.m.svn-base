//
//  ColumnBaseCollectionViewCell.m
//  cbox
//
//  Created by 王江亮 on 16/7/3.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import "ColumnBaseCollectionViewCell.h"

static NSString *columnentity = @"ColumnBaseCollectionViewCell";

@interface ColumnBaseCollectionViewCell ()
@property (nonatomic, weak) UIImageView *bigImageView;//左边大图
@property (nonatomic, weak) UILabel *upTitleLabel;//上部标题
@end

@implementation ColumnBaseCollectionViewCell

+ (instancetype)ColumnBaseCollectionViewCell: (UICollectionView *)collectionView indexpath: (NSIndexPath *)indexpath{

    ColumnBaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:columnentity forIndexPath:indexpath];
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
//    bigImageView.image = [UIImage imageNamed:@"456x342--综艺首页轮播图左侧小图.png"];
    [self.bigImageView setImageWithURL:[NSURL URLWithString: self.model.column_photo] placeholderImage:[UIImage imageNamed:@"320x240.jpg"]];

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
    upTitleLabel.numberOfLines =4;
    //    //调整行间距
    //    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    //    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //    [paragraphStyle setLineSpacing:1.01f]; //调整行间距
    //    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
    //    upTitleLabel.attributedText = attributedString;
    ////    [upTitleLabel sizeToFit];
//    //传递
//    self.upTitleLabel = upTitleLabel;
//    [self.contentView addSubview:upTitleLabel];
//    [upTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self).mas_offset(5);
//        make.left.equalTo(bigImageView.mas_right).mas_offset(8);
//        make.right.equalTo(self);
//        make.height.mas_equalTo(40);//行间距调整
//    }];
    
    self.upTitleLabel = upTitleLabel;
    [self.contentView addSubview:upTitleLabel];
    [upTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).mas_offset(5);
        make.left.equalTo(bigImageView.mas_right).mas_offset(8);
        make.right.equalTo(self);
        //        make.height.mas_equalTo(73);//行间距调整
    }];

}

- (void)setModel:(ColumnChannelModel *)model{
    
    _model = model;
    
//    //赋值
//    if (model.column_photo == nil) {
//        
//    }else{
//        [self.bigImageView setImageWithURL:[NSURL URLWithString:model.column_photo]];
//    }
    
//            [self.bigImageView setImageWithURL:[NSURL URLWithString:model.column_photo]]; 320x240
    
    [self.bigImageView setImageWithURL:[NSURL URLWithString:model.column_photo] placeholderImage:[UIImage imageNamed:@"320x240.jpg"]];

    
    if ([model.videoTitle isEqualToString:@""]) {
        
        self.upTitleLabel.text = model.column_name;
    }else{
        
        self.upTitleLabel.text = model.videoTitle;
    }
}


@end
