//
//  ColumnChannelModel.m
//  cbox
//
//  Created by 王江亮 on 16/7/7.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import "ColumnChannelModel.h"

@implementation ColumnChannelModel

+ (NSMutableArray *)parserColumnChannelModel: (NSMutableArray *)array{

    NSMutableArray *dataArr = [[NSMutableArray alloc] init];
    for (NSMutableDictionary *dic in array) {
        ColumnChannelModel *model = [[ColumnChannelModel alloc] init];
        model.column_photo = dic[@"column_photo"];
        model.column_name = dic[@"column_name"];
        model.vms_video_album_id = dic[@"vms_video_album_id"];
        //字典内标题
        model.lastVIDE = dic[@"lastVIDE"];
        model.videoTitle = model.lastVIDE[@"videoTitle"];
        [dataArr addObject:model];
    }
    return dataArr;
}



@end
