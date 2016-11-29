//
//  RecommendFilterSixCell.m
//  cbox
//
//  Created by 王江亮 on 16/7/15.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import "RecommendFilterSixCell.h"
#define subItemWidth 144
#define imgHeight 180
static NSString *identity = @"RecommendFilterSixCell";

@interface RecommendFilterSixCell()
@property (nonatomic, strong)UIImageView *image;
@property (nonatomic, strong)UIImageView *shadowImg;
@property (nonatomic, strong)UILabel *updateLabel;
@property (nonatomic, strong)UILabel *titleLabel;

@property (nonatomic, weak) IndexBaseItemView *baseView;

@end

@implementation RecommendFilterSixCell

+ (instancetype)recommendFilterSixCell: (UICollectionView *)collectionView indexpath: (NSIndexPath *)indexpath{

    RecommendFilterSixCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identity forIndexPath:indexpath];
    return cell;
}


- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
//        [self creatSubview];
//        self.backgroundColor = [UIColor yellowColor];
        [self creatBaseView];
    }
    return self;
}

- (void)creatBaseView{
    
    IndexBaseItemView *baseView = [IndexBaseItemView IndexBaseItemView:self.bounds];
//    baseView.rightButtomLabel.hidden = YES;
    baseView.userInteractionEnabled = NO;
    baseView.imgButtomLabel.hidden = YES;
    baseView.shadowImgView.hidden = NO;
    self.baseView = baseView;
    [self.contentView addSubview:baseView];
}


- (void)creatSubview{
    
//    NSInteger subItemWidth = 144;
//    NSInteger imgWidth = subItemWidth;
//    NSInteger imgHeight = 180 ;
    
    //主题图片
    self.image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, subItemWidth, imgHeight)];
    self.image.backgroundColor =[UIColor grayColor];
    [self addSubview: self.image];
    
    //底部阴影
    self.shadowImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"阴影.png"]];
//    self.shadowImg.frame =CGRectMake(0,imgHeight-25,subItemWidth,25);
    self.shadowImg.contentMode = UIViewContentModeScaleToFill;
    [self addSubview: self.shadowImg];
    weakedSelf
    [self.shadowImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(subItemWidth);
        make.height.mas_equalTo(25);
        make.bottom.equalTo(weakSelf.image);
        make.left.equalTo(weakSelf.image);
    }];
    
    //图片上的文字
    self.updateLabel =[[UILabel alloc] init];
//                       WithFrame:CGRectMake(0,imgHeight-25,subItemWidth-7,25)];
    self.updateLabel.textColor =HEX2RGB(@"#ffffff");
    self.updateLabel.font = [UIFont systemFontOfSize:12];
    self.updateLabel.textAlignment = NSTextAlignmentRight;
//    self.updateLabel.backgroundColor = MJRandomColor;
    [self addSubview: self.updateLabel];
    [self.updateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(subItemWidth-7);
        make.height.mas_equalTo(25);
        make.bottom.equalTo(weakSelf.image);
        make.left.equalTo(weakSelf.image);
    }];
    
    //图片底部的文字
    self.titleLabel =[[UILabel alloc] init];
//                      WithFrame:CGRectMake(0,imgHeight,subItemWidth,50)];
    self.titleLabel.textColor =HEX2RGB(@"#333333");
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    self.titleLabel.numberOfLines = 2;
    [self addSubview:self.titleLabel];
//    self.titleLabel.backgroundColor = MJRandomColor;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(subItemWidth);
        make.height.mas_equalTo(45);
        make.left.equalTo(weakSelf.image);
        make.top.equalTo(weakSelf.image.mas_bottom);
    }];
    
}

- (void)setItemData:(FilterListItem *)itemData{
    
    _itemData = itemData;
////    [self.image setImageWithURL:[NSURL URLWithString: itemData.img] placeholderImage:[UIImage imageNamed:@"456x342--综艺首页轮播图左侧小图.png"]];
//    [self.image setImageWithURL:[NSURL URLWithString: itemData.img] placeholderImage:[UIImage imageNamed:@"288x360.jpg"]];
//    self.updateLabel.text = itemData.js;
//    self.titleLabel.text = itemData.name;
    
    if ((itemData.name == nil)||[itemData.name isEqualToString:@""]) {
        self.baseView.hidden = YES;
        return;
    }else{
        self.baseView.hidden = NO;
    }
    
    [self.baseView.bigImageView setImageWithURL:[NSURL URLWithString:itemData.img] placeholderImage:[UIImage imageNamed:@"288x360.jpg"]];
    
//    if ([itemData.js isKindOfClass:[NSString class]]&&itemData.js.length>0) {//添加阴影和vsettype
//        self.baseView.rightButtomLabel.hidden = YES;
//    } else {
    self.baseView.rightButtomLabel.text = nil;
        self.baseView.rightButtomLabel.text= itemData.js;
//    }

    
//    if ([itemData.js isEqualToString:@""]) {
//        self.baseView.imgButtomLabel.hidden = YES;
//    }else{
//        self.baseView.imgButtomLabel.text= itemData.js;
//    }
    
    NSString *str = nil;
    str = itemData.name;
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
