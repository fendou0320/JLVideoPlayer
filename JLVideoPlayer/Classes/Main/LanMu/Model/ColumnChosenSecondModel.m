//
//  ColumnChosenSecondModel.m
//  cbox
//
//  Created by 王江亮 on 16/7/6.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import "ColumnChosenSecondModel.h"

@implementation ColumnChosenSecondModel

+ (NSMutableArray *)parserColumnChosenSecondModel:(NSMutableDictionary*)dict{
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    NSMutableArray *itemList = [dict objectForKey:@"video"];
    
    for (NSMutableDictionary *dic in itemList) {
        
        ColumnChosenSecondModel *model = [[ColumnChosenSecondModel alloc] init];
        
        //"vsid": "C10586",
        //"order": "2273",
        //"vid": "9629ee8991ab4356b860dc139729e690",
        //"t": "[新闻1+1]两会1+1：健全冤错案件源头防范机制",
        //"url": "http://tv.cntv.cn/video/C10586/9629ee8991ab4356b860dc139729e690",
        //"ptime": "2016-03-13 21:30:00",
        //"img": "http://p5.img.cctvpic.com/fmspic/2016/03/13/9629ee8991ab4356b860dc139729e690-51.jpg",
        //"len": "00:01:23",
        //"em": "CM02"
        
        model.vsid = dic[@"vsid"];
        model.order = dic[@"order"];
        model.vid = dic[@"vid"];
        model.t = dic[@"t"];
        model.url = dic[@"url"];
        model.ptime = dic[@"ptime"];
        model.img = dic[@"img"];
        model.len = dic[@"len"];
        model.em = dic[@"em"];
        
        [array addObject:model];
    }
    return array;
}


+ (NSMutableArray *)parserColumnChosenSecondAllModel:(NSMutableArray*)array{

    NSMutableArray *modelArray = [[NSMutableArray alloc]init];
    
    
    for (NSMutableDictionary *dic in array) {
        
        ColumnChosenSecondModel *model = [[ColumnChosenSecondModel alloc] init];
        
        model.vsid = dic[@"vsid"];
        
        NSMutableArray *listArr = [dic objectForKey:@"vlist"];
        
        NSMutableDictionary *listDic = listArr[0];
        
//        "order": "5003",
//        "vid": "0a807ab10cf644499df6c933fc795e53",
//        "t": "《百家讲坛》 20160809 唐宋八大家·苏轼4 伟大的天才与全才",
//        "url": "http://tv.cntv.cn/video/C10302/0a807ab10cf644499df6c933fc795e53",
//        "img": "http://p2.img.cctvpic.com/fmspic/2016/08/09/0a807ab10cf644499df6c933fc795e53-2408.jpg",
//        "len": "00:40:04",
//        "em": "CM01",
//        "lut": "2016-08-09 13:29:10"
//        model.order = dic[@"order"];
        
        model.vid = listDic[@"vid"];
        model.t = listDic[@"t"];
        model.url = listDic[@"url"];
        model.img = listDic[@"img"];
        
        [modelArray addObject:model];
    }
    
    return modelArray;
}



@end
