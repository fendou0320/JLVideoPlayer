//
//  ColumnChannelModel.h
//  cbox
//
//  Created by 王江亮 on 16/7/7.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColumnChannelModel : NSObject

//"column_pcut": "PAGE1451877222471954",
//"column_rcut": "PAGE1451877222471954",
//"column_photo": "http://p4.img.cctvpic.com/fmspic/vms/image/2015/02/04/VSET_1423018513645825.jpg",

//"lastVIDE": {
//    "videoBrief": "本期节目主要内容：\n1、开篇故事：资本方PK管理层 谁会受伤？；\n2、财经表情：金价刷新两年新高；\n3、财经表情：鸡蛋价格跌入低谷；\n4、财经表情：英国脱欧冲击波；\n5、财经表情：购车返现陷阱；\n6、本周人物：王石；\n7、本周人物：朱民；\n8、本周公司榜：\n（1）万科：究竟谁有话语权；\n（2）汽车之家：平安入主清洗管理层；\n（3）一汽：小股东逆袭股东会；\n（4）宝钢武钢：中国神钢呼之欲出；\n（5）高通：起诉魅族升级；\n9、微报告：翡翠市场低迷调查；\n10、书斋推荐：《门口的野蛮人》。\n（《财经周刊》 20160702）",
//    "videoUrl": "http://tv.cctv.com/2016/07/03/VIDEm6KIK5Ij5IRaLANvMQWB160703.shtml",
//    "videoId": "VIDEm6KIK5Ij5IRaLANvMQWB160703",
//    "videoTitle": "《财经周刊》 20160702",
//    "videoFocusDate": "1467480000000",
//    "videoSharedCode": "39d3604373864009b98378bbba3a3891"
//},

//"column_sort": "999",
//"column_name": "财经周刊",
//"column_playstatus": "1",
//"tabColProRelList": "",
//"operation": "",

//"create_date": "1453294273000",
//"column_shortname": "caijingzhoukan",
//"column_brief": "央视财经频道2015年新上档的《财经周刊》全部在央视新址上线播出，使用目前国内技术最为成熟的250纯虚拟演播室，全新的虚拟场景将与节目同步曝光。主创团队由财经频道调集诸多栏目的主力制片人、主编、记者、编辑等等人员倾力打造。多位主力在财经频道中工作十多年，曾担任重大活动、晚会以及纪录片总导演，另外还有原CNBC主持人李斯璇加盟，这支精英团队经过近半年时间精心筹备、反复论证、倾力打造的大数据财经杂志《财经周刊》于每周六晚22:40闪亮登场。\n",
//"delete_flag": "0",
//"column_photo2": "http://p4.img.cctvpic.com/fmspic/vms/image/2015/02/04/VSET_1423018513645825.jpg",

//"column_backvideoaddress": "http://tv.cctv.com/lm/cjzk/videoset",
//"create_date_string": "",
//"channel_name": "CCTV-2 财经",
//"departmentid": "DEPA1318815954806123",
//"column_type": "新闻",

//"column_firstletter": "C",
//"modify_date_string": "",
//"modify_date": "1455430984000",
//"column_logo": "http://p4.img.cctvpic.com/fmspic/vms/image/2015/02/04/VSET_1423018513645825.jpg",
//"vms_video_album_id": "VSET100220095839",

//"column_id": "EPGM1453294273056140",
//"column_website": "http://tv.cctv.com/lm/cjzk",
//"column_keyword": "",
//"column_guest": "李斯璇",
//"operator": "李志学",

//"channel_id": "EPGC1386744804340102",
//"actorList": "",
//"column_channeltype": "1",
//"column_iscompose": "0",
//"column_firstclass": "新闻",

//"column_secondclass": "财经",
//"tabTimelinesAirDateList": "",
//"channel_logo": "",
//"column_isissue": "1",
//"column_playdate": "每周六22:40",

//"column_playchannel": "http://tv.cctv.com/cctv2",
//"column_topicid": "TOPC1451529279927730"

@property (nonatomic, copy) NSString *column_pcut;
@property (nonatomic, copy) NSString *column_rcut;
@property (nonatomic, copy) NSString *column_photo;
@property (nonatomic, strong) NSMutableDictionary *lastVIDE;
//lastVIDE的title
@property (nonatomic, copy) NSString *videoTitle;

//"column_sort": "999",
//"column_name": "财经周刊",
//"column_playstatus": "1",
//"tabColProRelList": "",
//"operation": "",
@property (nonatomic, copy) NSString *column_sort;
@property (nonatomic, copy) NSString *column_name;
@property (nonatomic, copy) NSString *column_playstatus;
@property (nonatomic, copy) NSString *tabColProRelList;
@property (nonatomic, copy) NSString *operation;

@property (nonatomic, copy) NSString *create_date;
@property (nonatomic, copy) NSString *column_shortname;
@property (nonatomic, copy) NSString *column_brief;
@property (nonatomic, copy) NSString *delete_flag;
@property (nonatomic, copy) NSString *column_photo2;

//"column_backvideoaddress": "http://tv.cctv.com/lm/cjzk/videoset",
//"create_date_string": "",
//"channel_name": "CCTV-2 财经",
//"departmentid": "DEPA1318815954806123",
//"column_type": "新闻",
@property (nonatomic, copy) NSString *column_backvideoaddress;
@property (nonatomic, copy) NSString *create_date_string;
@property (nonatomic, copy) NSString *channel_name;
@property (nonatomic, copy) NSString *departmentid;
@property (nonatomic, copy) NSString *column_type;

//"column_firstletter": "C",
//"modify_date_string": "",
//"modify_date": "1455430984000",
//"column_logo": "http://p4.img.cctvpic.com/fmspic/vms/image/2015/02/04/VSET_1423018513645825.jpg",
//"vms_video_album_id": "VSET100220095839",
@property (nonatomic, copy) NSString *column_firstletter;
@property (nonatomic, copy) NSString *modify_date_string;
@property (nonatomic, copy) NSString *modify_date;
@property (nonatomic, copy) NSString *column_logo;
//视频集
@property (nonatomic, copy) NSString *vms_video_album_id;

//"column_id": "EPGM1453294273056140",
//"column_website": "http://tv.cctv.com/lm/cjzk",
//"column_keyword": "",
//"column_guest": "李斯璇",
//"operator": "李志学",
@property (nonatomic, copy) NSString *column_id;
@property (nonatomic, copy) NSString *column_website;
@property (nonatomic, copy) NSString *column_keyword;
@property (nonatomic, copy) NSString *column_guest;
//@property (nonatomic, copy) NSString *operator;

//"channel_id": "EPGC1386744804340102",
//"actorList": "",
//"column_channeltype": "1",
//"column_iscompose": "0",
//"column_firstclass": "新闻",
@property (nonatomic, copy) NSString *channel_id;
@property (nonatomic, copy) NSString *actorList;
@property (nonatomic, copy) NSString *column_channeltype;
@property (nonatomic, copy) NSString *column_iscompose;
@property (nonatomic, copy) NSString *column_firstclass;

//"column_secondclass": "财经",
//"tabTimelinesAirDateList": "",
//"channel_logo": "",
//"column_isissue": "1",
//"column_playdate": "每周六22:40",
@property (nonatomic, copy) NSString *column_secondclass;
@property (nonatomic, copy) NSString *tabTimelinesAirDateList;
@property (nonatomic, copy) NSString *channel_logo;
@property (nonatomic, copy) NSString *column_isissue;
@property (nonatomic, copy) NSString *column_playdate;

//"column_playchannel": "http://tv.cctv.com/cctv2",
//"column_topicid": "TOPC1451529279927730"
@property (nonatomic, copy) NSString *column_playchannel;
@property (nonatomic, copy) NSString *column_topicid;

+ (NSMutableArray *)parserColumnChannelModel: (NSMutableArray *)dic;

@end
