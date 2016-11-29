//
//  TuiJianViewController.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/10/18.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "TuiJianViewController.h"

@interface TuiJianViewController ()

@end

@implementation TuiJianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RandomColor;

//    NSDate *datenow = [NSDate date];
//    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
//    NSLog(@"timeSp:%@",timeSp); //时间戳的值
//
//    NSDate *date=[NSDate date];
//    NSDateFormatter *format1=[[NSDateFormatter alloc] init];
//    [format1 setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
//    NSString *dateStr;
//    dateStr=[format1 stringFromDate:date];
//    NSLog(@"%@",dateStr);
    
    NSString *str = @"1476144022";
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyyMMddHHMMss"];
    NSDate *date = [formatter dateFromString:str];
    
//    NSLog(@"时间戳:%@",date);
    
//    设置时间显示格式:
//    NSString* timeStr = @"2011-01-26 17:40:50";
//    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
//    [formatter setDateStyle:NSDateFormatterMediumStyle];
//    [formatter setTimeStyle:NSDateFormatterShortStyle];
//    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
//    
//    //设置时区,这个对于时间的处理有时很重要
//    //例如你在国内发布信息,用户在国外的另一个时区,你想让用户看到正确的发布时间就得注意时区设置,时间的换算.
//    //例如你发布的时间为2010-01-26 17:40:50,那么在英国爱尔兰那边用户看到的时间应该是多少呢?
//    //他们与我们有7个小时的时差,所以他们那还没到这个时间呢...那就是把未来的事做了
//    
//    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
//    [formatter setTimeZone:timeZone];
//    
//    NSDate* date = [formatter dateFromString:timeStr]; //------------将字符串按formatter转成nsdate
//    
//    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
//    
//    NSString *nowtimeStr = [formatter stringFromDate:datenow];//----------将nsdate按formatter格式转成nsstring
//    时间转时间戳的方法:
//    NSString *timeSp = [NSString stringWithFormat:@"%d", (long)[datenow timeIntervalSince1970]];
//    NSLog(@"timeSp:%@",timeSp); //时间戳的值
//    时间戳转时间的方法
//    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:1296035591];
//    NSLog(@"1296035591  = %@",confromTimesp);
//    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
//    NSLog(@"confromTimespStr =  %@",confromTimespStr);
//    时间戳转时间的方法:
//    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateStyle:NSDateFormatterMediumStyle];
//    [formatter setTimeStyle:NSDateFormatterShortStyle];
//    [formatter setDateFormat:@"yyyyMMddHHMMss"];
//    NSDate *date = [formatter dateFromString:@"1283376197"];
//    NSLog(@"date1:%@",date);
//    [formatter release];  
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
