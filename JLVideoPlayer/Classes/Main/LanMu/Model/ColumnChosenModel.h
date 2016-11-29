//
//  ColumnChosenModel.h
//  cbox
//
//  Created by 王江亮 on 16/7/1.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColumnChosenModel : NSObject
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

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *brief;
@property (nonatomic, copy) NSString *imgUrl;
@property (nonatomic, copy) NSString *bigImgUrl;
@property (nonatomic, copy) NSString *cmsImgType;
@property (nonatomic, copy) NSString *vsetId;
@property (nonatomic, copy) NSString *vsetCid;
@property (nonatomic, copy) NSString *vsetEm;
@property (nonatomic, copy) NSString *columnSo;
@property (nonatomic, copy) NSString *vsetPageid;
@property (nonatomic, copy) NSString *isShow;
@property (nonatomic, copy) NSString *order;

+ (NSMutableArray *)parserColumnItemListModel:(NSMutableDictionary*)dict;

@end
