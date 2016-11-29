//
//  CategorySubItemMode.h
//  cbox
//
//  Created by JAX on 15/10/21.
//  Copyright © 2015年 tjianli. All rights reserved.
//

#import <Foundation/Foundation.h>

//分类子栏目内容Item Model
@interface CategoryItemMode : NSObject
{
}
@property(nonatomic , strong) NSString * title;//标题
@property(nonatomic , strong) NSString * brief;//副标题
@property(nonatomic , strong) NSString * imgUrl;//说明图
@property(nonatomic , strong) NSString * bigImgUrl;//大图
@property(nonatomic , strong) NSString * vsetType;//视频集状态
@property(nonatomic , strong) NSString * vtype;//播放类型区分
/*（1---单视频；2---视频集竖图(VMS视频集)；3---视频集横图(VMS视频集)；4---栏目横图(VMS视频集)；5---爱西柚视频集；6---特辑(CMS视频集);7---url打开浏览器；8---直播频道,9--分类，11---投票(h5)，12---答题(h5)，13---抽奖(h5)，14---评论(h5)，15---春晚互动）",*/
@property(nonatomic , strong) NSString * listUrl;//cms视频集地址
@property(nonatomic , strong) NSString * vid;//单视频ID
@property(nonatomic , strong) NSString * channelId;//频道ID
@property(nonatomic , strong) NSString * vsetId;//视频集ID
@property(nonatomic , strong) NSString * vsetCid;//视频集类型ID(确定视频集列表展现形式，以及详情模板,如果没有cid，为默认模板)
@property(nonatomic , strong) NSString * vsetEm;//视频集精切&粗切，空为精粗切都有
@property(nonatomic , strong) NSString * interactid;  //不能少
@property(nonatomic , strong) NSString * shareUrl;//pc端页面分享地址
@property(nonatomic , strong) NSString * pcUrl;//打开浏览器url
@property(nonatomic, strong)  NSString * categoryId;//跳转点播分类id
@property(nonatomic, strong)  NSString * categoryUrl;//跳转点播分类url
@property(nonatomic, strong)  NSString * categoryAid;//跳转点播分类广告ID
@property(nonatomic, strong)  NSString * cornerStr;//角标文字（两个字）
@property(nonatomic, strong)  NSString * cornerColour;//角标颜色 例如 #000000
@property(nonatomic , strong) NSString * columnSo;//（0或者空：列表，1：时间查询）
@property(nonatomic , strong) NSString * vsetPageid;//(按时间查询视频集ID)
@property(nonatomic , strong) NSString * isShow;//空为全展示，0仅PC，1仅移动
@property(nonatomic , strong) NSString * order;//1

//6.10新需求栏目模块使用
@property (nonatomic, copy) NSString *cmsImgType;


/*                "moduleType":"",
 "title":"“酷女孩”窦靖童：我还不想长大",
 "brief":"",
 "imgUrl":"http://p1.img.cctvpic.com/photoAlbum/page/performance/img/2016/6/12/1465715504401_837.jpg",
 "imgUrl_1":"",
 "imgUrl_2":"",
 "vsetType":"",
 "vtype":"1",
 "listUrl":"",
 "vid":"d0be281b0ec04d1f8808f907689c97da",
 "channelId":"",
 "vsetId":"",
 "video_length":"00:01:51",
 "vsetCid":"",
 "vsetEm":"",
 "shareUrl":"",
 "pcUrl":"",
 "interactid":"",
 "categoryId":"",
 "categoryUrl":"",
 "categoryAid":"",
 "cornerStr":"",
 "cornerColour":"",
 "columnSo":"",
 "vsetPageid":"",
 "isShow":"",
 "order":"4"*/

//解析单个
+(CategoryItemMode*)parserItemModel:(NSMutableDictionary*)data;

//解析一组
+(NSMutableArray *)parserItemListModel:(NSMutableArray*)data;

@end
