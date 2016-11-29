//
//  RecommendFilterFourCell.m
//  cbox
//
//  Created by 王江亮 on 16/7/15.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import "RecommendFilterFourCell.h"
#import "IndexBaseItemView.h"

static NSString *identity = @"RecommendFilterFourCell";

@interface RecommendFilterFourCell ()
//@property (nonatomic, strong)UIImageView *image;
//@property (nonatomic, strong)UIImageView *shadowImg;
//@property (nonatomic, strong)UILabel *updateLabel;
//@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, weak) UIImageView *bigImageView;//左边大图
@property (nonatomic, weak) UILabel *upTitleLabel;//上部标题

@property (nonatomic, weak) IndexBaseItemView *baseView;

@end

@implementation RecommendFilterFourCell

+ (instancetype)recommendFilterFourCell: (UICollectionView *)collectionView indexpath: (NSIndexPath *)indexpath{

    RecommendFilterFourCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identity forIndexPath:indexpath];
    return cell;
}


- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
//        [self creatSubview];
//        self.backgroundColor = [UIColor greenColor];
        [self creatBaseView];
    }
    return self;
}

- (void)creatBaseView{

    IndexBaseItemView *baseView = [IndexBaseItemView IndexBaseItemView:self.bounds];
    baseView.rightButtomLabel.hidden = YES;
    baseView.imgButtomLabel.hidden = YES;
    baseView.shadowImgView.hidden = YES;
    baseView.userInteractionEnabled = NO;
    self.baseView = baseView;
    [self.contentView addSubview:baseView];
}

- (void)creatSubview{
    
//    NSInteger subItemWidth = 144;
//    NSInteger imgWidth = subItemWidth;
//    NSInteger imgHeight = 180 ;
//    
//    //主题图片
//    self.image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imgWidth, imgHeight)];
//    self.image.backgroundColor =[UIColor grayColor];
//    [self addSubview: self.image];
//    
//    //底部阴影
//    self.shadowImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"阴影.png"]];
//    self.shadowImg.frame =CGRectMake(0,imgHeight-25,subItemWidth,25);
//    self.shadowImg.contentMode = UIViewContentModeScaleToFill;
//    [self addSubview: self.shadowImg];
//    
//    //图片上的文字
//    self.updateLabel =[[UILabel alloc] initWithFrame:CGRectMake(0,imgHeight-25,subItemWidth-7,25)];
//    self.updateLabel.textColor =HEX2RGB(@"#ffffff");
//    self.updateLabel.font = [UIFont systemFontOfSize:12];
//    self.updateLabel.textAlignment = NSTextAlignmentRight;
//    [self addSubview: self.updateLabel];
//    
//    //图片底部的文字
//    self.titleLabel =[[UILabel alloc] initWithFrame:CGRectMake(0,imgHeight,subItemWidth,50)];
//    self.titleLabel.textColor =HEX2RGB(@"#333333");
//    self.titleLabel.font = [UIFont systemFontOfSize:15];
//    self.titleLabel.numberOfLines = 2;
//    [self addSubview:self.titleLabel];
    
    
    //图片bigImageView
    UIImageView *bigImageView = [[UIImageView alloc]init];
    bigImageView.contentMode = UIViewContentModeScaleToFill;
    //    bigImageView.image = [UIImage imageNamed:@"456x342--综艺首页轮播图左侧小图.png"];
    self.bigImageView = bigImageView;
    [self.contentView addSubview:bigImageView];
    [bigImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self).mas_offset(-45);
        
    }];
    
    //标题titleLabel
    UILabel *upTitleLabel = [[UILabel alloc]init];
    upTitleLabel.font = [UIFont systemFontOfSize:16.0f];
    upTitleLabel.textColor = HEX2RGB(@"#000000");
    //    upTitleLabel.numberOfLines =2;
    [upTitleLabel sizeToFit];
    self.upTitleLabel = upTitleLabel;
    [self.contentView addSubview:upTitleLabel];
    [upTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.top.equalTo(self).mas_offset(5);
        //        make.left.equalTo(bigImageView.mas_right).mas_offset(8);
        //        make.right.equalTo(self);
        //        make.top.equalTo(bigImageView.mas_bottom).with.offset(10);
        
        make.top.equalTo(bigImageView.mas_bottom).with.offset(10);
        make.right.equalTo(self);
        make.left.equalTo(self);
        make.height.mas_equalTo(35);
        
    }];

    
    
}

- (void)setItemData:(FilterListItem7PE *)itemData{
    
//    _itemData = itemData;
//    
//    [self.image setImageWithURL:[NSURL URLWithString: itemData.imgUrl] placeholderImage:[UIImage imageNamed:@"456x342--综艺首页轮播图左侧小图.png"]];
//    
//    self.titleLabel.text = itemData.title;
    
    
    
    _itemData = itemData;
//    //赋值
//    if (_itemData.imgUrl == nil) {
//        
//    }else{
////        [self.bigImageView setImageWithURL:[NSURL URLWithString:_itemData.imgUrl] placeholderImage:[UIImage imageNamed:@"456x342--综艺首页轮播图左侧小图.png"]];
//        [self.bigImageView setImageWithURL:[NSURL URLWithString:_itemData.imgUrl] placeholderImage:[UIImage imageNamed:@"456x342.jpg"]];
//    }
//    
//    if ([_itemData.title isEqualToString:@""]) {
//        self.upTitleLabel.hidden = YES;
//    }else{
//        self.upTitleLabel.text = _itemData.title;
//    }
    
    
    [self.baseView.bigImageView setImageWithURL:[NSURL URLWithString:_itemData.imgUrl] placeholderImage:[UIImage imageNamed:@"456x342.jpg"]];
    
    NSString *str = nil;
    str = _itemData.title;
    self.baseView.upSmallPicLabel.text = str;
    
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
