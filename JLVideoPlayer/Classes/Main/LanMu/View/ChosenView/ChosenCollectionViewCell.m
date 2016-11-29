//
//  ChosenCollectionViewCell.m
//  cbox
//
//  Created by 王江亮 on 16/6/30.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import "ChosenCollectionViewCell.h"

static NSString *identity = @"ChosenCollectionViewCell";

@interface ChosenCollectionViewCell (){
    
    //是否收藏
    BOOL isChosen;
}
@property (nonatomic, weak) UIImageView *bigImageView;//左边大图
@property (nonatomic, weak) UILabel *upTitleLabel;//上部标题
//@property (nonatomic, weak) UILabel *downTitleLabel;//下部标题
//@property (nonatomic, weak) UILabel *markLabel;//收藏
//@property (nonatomic, weak) UIImageView *starImageView;//星星大图
@property (nonatomic, weak) UIButton *markLabel;//收藏
@property (nonatomic, weak) UIButton *starImageView;
@end

@implementation ChosenCollectionViewCell

+ (instancetype)chosenCollectionViewCell: (UICollectionView *)collectionView indexpath: (NSIndexPath *)indexpath{
    
    ChosenCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identity forIndexPath:indexpath];
    return cell;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
 //        CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
//        CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
//        CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
//        self.backgroundColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
        [self creatSubview];
    }
    return self;
}

- (void)creatSubview{
    
//    for (UIView *view in self.contentView.subviews) {
//        [view removeFromSuperview];
//    }
    
    //图片bigImageView
    UIImageView *bigImageView = [[UIImageView alloc]init];
    bigImageView.contentMode = UIViewContentModeScaleToFill;
    bigImageView.image = [UIImage imageNamed:@"320x240.jpg"];
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
//        make.height.mas_equalTo(73);//行间距调整
    }];
    
    //下标题
//    UILabel *downTitleLabel = [[UILabel alloc]init];
//    downTitleLabel.font = [UIFont systemFontOfSize:13.0];
//    downTitleLabel.textColor = HEX2RGB(@"#000000");
//    //    downTitleLabel.text = @"皑如山上雪，皎若云间月闻君有两意，故来相决绝今日斗酒会，明旦沟水头躞蹀御沟上，沟水东西流";
//    //    downTitleLabel.backgroundColor = [UIColor greenColor];
//    downTitleLabel.numberOfLines =0;
//    downTitleLabel.hidden = YES;
//    self.downTitleLabel = downTitleLabel;
//    [self.contentView addSubview:downTitleLabel];
    
    //标签
    //    UILabel *markLabel = [[UILabel alloc]init];
    //    markLabel.font = [UIFont systemFontOfSize:16.0];
    //    markLabel.textColor = HEX2RGB(@"#009be5");
    //    markLabel.text = @"已收藏";
    //    markLabel.numberOfLines =1;
    UIButton *markLabel = [UIButton buttonWithType:UIButtonTypeCustom];
//    markLabel.backgroundColor = [UIColor greenColor];
    markLabel.titleLabel.font = [UIFont systemFontOfSize:16.0];
//    markLabel.titleLabel.textAlignment = NSTextAlignmentLeft;
    markLabel.tag = 11;
    //收藏与未收藏
    [markLabel setTitle:@"收藏" forState:UIControlStateNormal];
    [markLabel setTitle:@"已收藏" forState:UIControlStateSelected];
    
    [markLabel addTarget:self action:@selector(chosenClick:) forControlEvents:UIControlEventTouchUpInside];
    self.markLabel = markLabel;
    
    [self.markLabel.titleLabel setTextAlignment:NSTextAlignmentRight];
    
    [self.contentView addSubview:markLabel];
    [markLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self).mas_offset(-3);//改
        make.right.equalTo(self).mas_offset(-11);//改
//        make.width.mas_equalTo(50);
        make.height.mas_equalTo(24);
    }];
    
    //图片bigImageView
    //    UIImageView *starImageView = [[UIImageView alloc]init];
    //    starImageView.contentMode = UIViewContentModeScaleToFill;
    //    starImageView.image = [UIImage imageNamed:@"03.栏目[02]_02_selected"];
    UIButton *starImageView = [UIButton buttonWithType:UIButtonTypeCustom];
//    starImageView.backgroundColor = MJRandomColor;
    [starImageView setContentMode:UIViewContentModeScaleToFill];
    starImageView.tag = 12;
//    starImageView.backgroundColor = [UIColor redColor];
    //收藏照片和非收藏照片的设置
    [starImageView setImage:[UIImage imageNamed:@"03.栏目[02]_02"] forState:UIControlStateNormal];
    [starImageView setImage:[UIImage imageNamed:@"03.栏目[02]_02_selected"] forState:UIControlStateSelected];
    [starImageView addTarget:self action:@selector(chosenClick:) forControlEvents:UIControlEventTouchUpInside];
    self.starImageView = starImageView;
    [self.contentView addSubview:starImageView];
    [starImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self).mas_offset(-6);
//        make.centerY.equalTo(self.markLabel);
        make.bottom.equalTo(self).mas_offset(-5);
        make.right.equalTo(markLabel.mas_left).mas_offset(-4);
        make.width.mas_equalTo(24);
        make.height.mas_equalTo(24);
    }];    
}



@end
