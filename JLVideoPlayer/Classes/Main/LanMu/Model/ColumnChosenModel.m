//
//  ColumnChosenModel.m
//  cbox
//
//  Created by 王江亮 on 16/7/1.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import "ColumnChosenModel.h"

@implementation ColumnChosenModel

+ (NSMutableArray *)parserColumnItemListModel:(NSMutableDictionary*)dict{

    NSMutableArray *array = [[NSMutableArray alloc]init];
    NSMutableArray *itemList = [dict objectForKey:@"itemList"];
    
    for (NSMutableDictionary *dic in itemList) {
        ColumnChosenModel *model = [[ColumnChosenModel alloc] init];
        
        //"title": "焦点访谈",
        //"brief": "",
        //"imgUrl": "http://p1.img.cctvpic.com/photoAlbum/page/performance/img/2015/4/21/1429609708257_83.jpg",
        //"bigImgUrl": "",
        //"cmsImgType": "1",
        //"vsetId": "C10326",
        //"vsetCid": "",
        //"vsetEm": "",
        //"columnSo": "1",
        //"vsetPageid": "PAGEP1dEaiKB4LVW3lwtQ9qX160120",
        //"isShow": "",
        //"order": "1"
        model.title = dic[@"title"];
        model.brief = dic[@"brief"];
        model.imgUrl = dic[@"imgUrl"];
        model.bigImgUrl = dic[@"bigImgUrl"];
        model.cmsImgType = dic[@"cmsImgType"];
        model.vsetId = dic[@"vsetId"];
        model.vsetCid = dic[@"vsetCid"];
        model.vsetEm = dic[@"vsetEm"];
        model.columnSo = dic[@"columnSo"];
        model.vsetPageid = dic[@"vsetPageid"];
        model.isShow = dic[@"isShow"];
        model.order = dic[@"order"];
        
        [array addObject:model];
    }
    return array;
}


@end
