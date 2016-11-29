//
//  CategorySubItemMode.m
//  cbox
//
//  Created by JAX on 15/10/21.
//  Copyright © 2015年 tjianli. All rights reserved.
//

#import "CategoryItemMode.h"

@implementation CategoryItemMode

+(CategoryItemMode*)parserItemModel:(NSMutableDictionary*)data
{
    CategoryItemMode *item = [[CategoryItemMode  alloc]   init];
    item.title = [data objectForKey: @"title" ];
    item.brief = [data objectForKey: @"brief" ];
    item.imgUrl = [data objectForKey: @"imgUrl" ];
    item.bigImgUrl = [data objectForKey: @"bigImgUrl" ];
    item.vsetType = [data objectForKey: @"vsetType" ];
    item.vtype = [data objectForKey: @"vtype" ];
    item.listUrl = [data objectForKey: @"listUrl" ];
    item.vid = [data objectForKey: @"vid" ];
    item.channelId = [data objectForKey: @"channelId" ];
    item.vsetId = [data objectForKey: @"vsetId" ];
    item.vsetCid = [data objectForKey: @"vsetCid" ];
    item.vsetEm = [data objectForKey: @"vsetEm" ]; 
    item.interactid = [data objectForKey: @"interactid" ];
    item.shareUrl = [data objectForKey: @"shareUrl" ];
    item.pcUrl = [data objectForKey: @"pcUrl" ];
    item.categoryId = [data objectForKey: @"categoryId" ];
    item.categoryUrl = [data objectForKey: @"categoryUrl" ];
    item.categoryAid = [data objectForKey: @"categoryAid" ];
    item.cornerStr = [data objectForKey: @"cornerStr" ];
    item.cornerColour = [data objectForKey: @"cornerColour" ];
    item.columnSo = [data objectForKey: @"columnSo" ];
    item.vsetPageid = [data objectForKey: @"vsetPageid" ];
    item.isShow = [data objectForKey: @"isShow" ];
    item.order = [data objectForKey: @"order" ];
    //6.10新添加
    item.cmsImgType = [data objectForKey:@"cmsImgType"];
    return item;
}

+(NSMutableArray *)parserItemListModel:(NSMutableArray*)data
{
    NSMutableArray  *parseResult = [[NSMutableArray alloc] init];
    for(int i=0;i< [data count]; i++)
    {
        NSMutableDictionary *tmpDict = [ data  objectAtIndex: i];
        CategoryItemMode *item = [CategoryItemMode  parserItemModel:tmpDict];
        if ([item.isShow isEqualToString:@"0"] )  //0是PC端的
        {
            continue;
        }
        [parseResult addObject:item];
    }
    
    return parseResult;
}

@end
