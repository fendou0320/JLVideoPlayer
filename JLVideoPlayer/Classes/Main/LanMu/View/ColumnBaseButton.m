//
//  ColumnBaseButton.m
//  cbox
//
//  Created by 王江亮 on 16/7/7.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import "ColumnBaseButton.h"

@implementation ColumnBaseButton

- (id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        [self setTitleColor:HEX2RGB(@"#666666") forState:UIControlStateNormal];
        [self setTitleColor:HEX2RGB(@"#009be5") forState:UIControlStateSelected];
        [self setTitleColor:HEX2RGB(@"#666666") forState:UIControlStateDisabled];
        self.titleLabel.font = [UIFont systemFontOfSize:16.0];
        self.selected = NO;
    }
    return self;
}

- (void)setModel:(FilterItemBody *)model{

    _model = model;
    [self setTitle:model.title forState:UIControlStateNormal];
}

@end
