//
//  SportsCollectionViewCell.m
//  cbox
//
//  Created by 朝阳 on 16/5/6.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import "SportsCollectionViewCell.h"

static NSString *identity = @"SportsCollectionViewCell";

@interface SportsCollectionViewCell ()
@property (nonatomic, strong)UIImageView *image;
@property (nonatomic, strong)UIImageView *shadowImg;
@property (nonatomic, strong)UILabel *updateLabel;
@property (nonatomic, strong)UILabel *titleLabel;
@end

@implementation SportsCollectionViewCell

+ (instancetype)sportsCollectionView: (UICollectionView *)collectionView indexpath: (NSIndexPath *)indexpath{

    SportsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identity forIndexPath:indexpath];
    return cell;
    
}

- (id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        [self creatSubview];
    }
    return self;
}

- (void)creatSubview{

    NSInteger imgWidth = 228;
    NSInteger imgHeight = 342/2 ;

    //主题图片
    self.image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imgWidth, imgHeight)];
    [self addSubview: self.image];
    
    //底部阴影
    self.shadowImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"阴影.png"]];
    self.shadowImg.frame =CGRectMake(0,imgHeight-25,imgWidth,25);
    self.shadowImg.contentMode = UIViewContentModeScaleToFill;
    [self addSubview: self.shadowImg];
    
    //图片上的文字
    self.updateLabel =[[UILabel alloc] initWithFrame:CGRectMake(0,imgHeight-25,imgWidth-7,25)];
    self.updateLabel.textColor =HEX2RGB(@"#ffffff");
    self.updateLabel.font = [UIFont systemFontOfSize:12];
    self.updateLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview: self.updateLabel];
    
    //图片底部的文字
    self.titleLabel =[[UILabel alloc] initWithFrame:CGRectMake(0,imgHeight+5,imgWidth,25)];
    self.titleLabel.textColor =HEX2RGB(@"#333333");
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.titleLabel];
}

- (void)setItemData:(FilterListItem7PE *)itemData{

    _itemData = itemData;
//    [self.image setImageWithURL:[NSURL URLWithString: itemData.imgUrl] placeholderImage:[UIImage imageNamed:@"456x342--综艺首页轮播图左侧小图.png"]];
    [self.image setImageWithURL:[NSURL URLWithString: itemData.imgUrl] placeholderImage:[UIImage imageNamed:@"456x342.jpg"]];
    self.titleLabel.text = itemData.title;

}


@end
