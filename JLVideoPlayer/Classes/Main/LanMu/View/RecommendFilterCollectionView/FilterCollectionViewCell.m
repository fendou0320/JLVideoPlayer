//
//  FilterCollectionViewCell.m
//  cbox
//
//  Created by 王江亮 on 16/7/5.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import "FilterCollectionViewCell.h"
#import "IndexBaseItemView.h"

static NSString *filterIdentity = @"FilterCollectionViewCell";

@interface FilterCollectionViewCell ()
//@property (nonatomic, weak) UIImageView *bigImageView;//左边大图
//@property (nonatomic, weak) UILabel *upTitleLabel;//上部标题

@property (nonatomic, weak) IndexBaseItemView *baseView;
@end

@implementation FilterCollectionViewCell

+ (instancetype)filterCollectionViewCell: (UICollectionView *)collectionView indexpath: (NSIndexPath *)indexpath{

    FilterCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:filterIdentity forIndexPath:indexpath];
    return cell;
}

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = HEX2RGB(@"#ffffff");
        
//        [self creatSubview];
        
//        if (self.baseView) {
//            [self.baseView removeFromSuperview];
//            self.baseView = nil;
//        }
        
//        UIButton *btn = [[UIButton alloc] initWithFrame:self.bounds];
//        [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:btn];
        
        
        IndexBaseItemView *baseView = [IndexBaseItemView IndexBaseItemView:self.bounds];
        baseView.backgroundColor = [UIColor clearColor];
        baseView.rightButtomLabel.hidden = YES;
        baseView.imgButtomLabel.hidden = YES;
        baseView.shadowImgView.hidden = YES;
        self.baseView = baseView;
        [self.contentView addSubview:baseView];
        
        baseView.userInteractionEnabled = NO;
        
//        [baseView setClickBlock:^(id sender){
//            
//            self.selected = YES;
//            btn.selected = YES;
//            
//        }];
        
//        self.backgroundColor = [UIColor redColor];
    }
    return self;
}


//- (void)creatSubview{
//
//    
//    //图片bigImageView
//    UIImageView *bigImageView = [[UIImageView alloc]init];
//    bigImageView.contentMode = UIViewContentModeScaleToFill;
////    bigImageView.image = [UIImage imageNamed:@"456x342--综艺首页轮播图左侧小图.png"];
//    self.bigImageView = bigImageView;
//    [self.contentView addSubview:bigImageView];
//    [bigImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self);
//        make.left.equalTo(self);
//        make.right.equalTo(self);
//        make.bottom.equalTo(self).mas_offset(-45);
//
//    }];
//    
//    //标题titleLabel
//    UILabel *upTitleLabel = [[UILabel alloc]init];
//    upTitleLabel.font = [UIFont systemFontOfSize:16.0f];
//    upTitleLabel.textColor = HEX2RGB(@"#333333");
//    upTitleLabel.numberOfLines =2;
//    [upTitleLabel sizeToFit];
//    self.upTitleLabel = upTitleLabel;
//    [self.contentView addSubview:upTitleLabel];
//    [upTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.top.equalTo(self).mas_offset(5);
////        make.left.equalTo(bigImageView.mas_right).mas_offset(8);
////        make.right.equalTo(self);
////        make.top.equalTo(bigImageView.mas_bottom).with.offset(10);
//        
//        make.top.equalTo(bigImageView.mas_bottom).with.offset(10);
//        make.right.equalTo(self);
//        make.left.equalTo(self);
////        make.height.mas_equalTo(35);
// 
//    }];
//
//}


- (void)setModel:(ColumnChannelModel *)model{

    _model = model;
    
    if (((model.column_name == nil)||[model.column_name isEqualToString:@""])&&((model.videoTitle == nil)||[model.videoTitle isEqualToString:@""])) {
        self.baseView.hidden = YES;
        return;
    }else{
        self.baseView.hidden = NO;
    }

    
    //赋值
//    if (model.column_photo == nil) {
//        
//    }else{
////        [self.bigImageView setImageWithURL:[NSURL URLWithString:model.column_photo] placeholderImage:[UIImage imageNamed:@"456x342--综艺首页轮播图左侧小图.png"]];
//    }
    
    
//    [self.bigImageView setImageWithURL:[NSURL URLWithString:model.column_photo] placeholderImage:[UIImage imageNamed:@"456x342.jpg"]];
//
//    
//    if ([model.videoTitle isEqualToString:@""]) {
//        self.upTitleLabel.text = model.column_name;
//    }else{
//        self.upTitleLabel.text = model.videoTitle;
//    }
    
    
    
//    
//    
//    [self.bigImageView setImageWithURL:[NSURL URLWithString:model.column_photo] placeholderImage:[UIImage imageNamed:@"456x342.jpg"]];
//
//
//    if ([model.videoTitle isEqualToString:@""]) {
//        self.upTitleLabel.text = model.column_name;
//    }else{
//        self.upTitleLabel.text = model.videoTitle;
//    }

    
    [self.baseView.bigImageView setImageWithURL:[NSURL URLWithString:model.column_photo] placeholderImage:[UIImage imageNamed:@"456x342.jpg"]];

    NSString *str = nil;
    if ([model.videoTitle isEqualToString:@""]) {
//        self.upTitleLabel.text = model.column_name;
        self.baseView.upSmallPicLabel.text = model.column_name;
        str =model.column_name;
    }else{
//        self.upTitleLabel.text = model.videoTitle;
        self.baseView.upSmallPicLabel.text = model.videoTitle;
        str = model.videoTitle;
    }
    
    CGSize size = CGSizeMake(self.width, MAXFLOAT);
    UIFont *font = self.baseView.upSmallPicLabel.font;
    NSDictionary *dic = @{NSFontAttributeName:font};
    
    CGSize titleSize = [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    if ( titleSize.height > 20) {
        [self.baseView.upSmallPicLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(40);
        }];
        [self.baseView layoutIfNeeded];
    }else {
        [self.baseView.upSmallPicLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(16);
        }];
        [self.baseView layoutIfNeeded];

    }
    
}




@end
