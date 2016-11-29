//
//  NoSearchPromptView.m
//  cbox
//
//  Created by 王江亮 on 16/7/23.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import "NoSearchPromptView.h"

@implementation NoSearchPromptView

+ (instancetype)noSearchPromptViewWithFrame: (CGRect)frame{
    
    NoSearchPromptView *netErrorView = [[NoSearchPromptView alloc] initWithFrame:frame];
    return netErrorView;
}


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
//        self.backgroundColor = [UIColor redColor];
        
        UILabel *headerLabel = [[UILabel alloc] init];//WithFrame:CGRectMake(0, -30, 1024, 201)];
        headerLabel.textColor = HEX2RGB(@"#a3a3a3");
//        headerLabel.textAlignment = NSTextAlignmentCenter;
//        headerLabel.backgroundColor = [UIColor clearColor];
        headerLabel.font = [UIFont systemFontOfSize:21.0f];
        headerLabel.text = @"暂无对应的筛选结果，请尝试其他类型，或使用搜索找您喜欢的内容。";
        [self addSubview:headerLabel];

        [headerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
//            make.top.equalTo(self.mas_top).with.offset(24/2);
            make.centerX.equalTo(self.mas_centerX).with.offset(0);
            make.centerY.equalTo(self.mas_centerY).with.offset(0);
            make.height.mas_equalTo(42/2);
        }];

        self.hidden = YES;
    }
    return self;
}


@end
