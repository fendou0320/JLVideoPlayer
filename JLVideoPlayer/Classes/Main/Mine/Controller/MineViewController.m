//
//  MineViewController.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/10/18.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RandomColor;

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 400, 300)];
    view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view];
    
    CustomLabel *channelLabel = [[CustomLabel alloc]init];
    channelLabel.verticalAlignment = VerticalAlignmentTop;
    channelLabel.numberOfLines = 2;
    channelLabel.font = [UIFont systemFontOfSize:18];
    channelLabel.textColor = [UIColor greenColor];
    [view addSubview:channelLabel];
    [channelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(view);
        make.left.equalTo(view.mas_left).with.offset(8);
        make.top.equalTo(view).with.offset(18/2);
//        make.height.mas_equalTo(18);
    }];
    channelLabel.backgroundColor = [UIColor purpleColor];
    
    NSString *channelStr = @"计数＋1";//在这两句代码中间的执行代码，每次只会允许一个线程进入，这样就有效的保证了在多线程环境下，只能有一个线程进入。";

    channelLabel.attributedText = [self attringStr:channelStr titleHeight:36/2 lineHeight:6/2];
//    [channelLabel sizeToFit];
    
    CustomLabel *titleView = [[CustomLabel alloc]init];
    titleView.backgroundColor = [UIColor clearColor];
    titleView.verticalAlignment = VerticalAlignmentTop;
    titleView.textColor =[UIColor redColor];
    titleView.numberOfLines = 3;
    titleView.font = [UIFont systemFontOfSize:15.0];
    [view addSubview:titleView];
    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_left).with.offset(9);
        make.right.equalTo(view);
        make.top.equalTo(channelLabel.mas_bottom).with.offset(18/2-4);//uilabel显示高度有误所以-4
    }];

    NSString *titleStr = @"如果基于第一种修改方法：既然该类中已经有一个“初始化方法” (initializer)，用于设置“姓名”(Name)、“年龄”(Age)和“性别”(Sex）的初始值: 那么在设计对应 @property 时就应该尽量使用不可变的对象：其三个属性都应该设为“只读”。用初始化方法设置好属性值之后，就不能再改变了。在本例中，仍需声明属性的“内存管理语义”。于是可以把属性的定义改成这样";
    
    titleView.backgroundColor = [UIColor purpleColor];

    titleView.attributedText = [self attringStr:titleStr titleHeight:30/2 lineHeight:12/2];
//    [channelLabel sizeToFit];

    
}

- (NSMutableAttributedString *)attringStr: (NSString *)titleStr titleHeight: (CGFloat)titleHeight lineHeight: (CGFloat)lineHeight{
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:titleStr];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:titleHeight] range:NSMakeRange(0, 0)];
    //段落
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineHeight];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [titleStr length])];
    return attributedString;
}




@end
