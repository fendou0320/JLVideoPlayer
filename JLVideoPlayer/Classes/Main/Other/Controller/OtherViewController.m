//
//  OtherViewController.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/10/19.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "OtherViewController.h"

#import "ErweimaViewController.h"
#import "WebController.h"

@interface OtherViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    //创建一个分组样式的UITableView
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //设置数据源，注意必须实现对应的UITableViewDataSource协议
    _tableView.dataSource=self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"二维码";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"webView";
    }
//    else if (indexPath.row == 2){
//        cell.textLabel.text = @"简单圆环";
//    }else if (indexPath.row == 3){
//        cell.textLabel.text = @"复杂动态圆环";
//    }else if (indexPath.row == 4){
//        cell.textLabel.text = @"简单柱状图";
//    }else if (indexPath.row == 5){
//        cell.textLabel.text = @"复杂柱状图";
//    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        ErweimaViewController *jd = [[ErweimaViewController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
    }else if (indexPath.row == 1){
        WebController *jd = [[WebController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
    }
    
//    else if (indexPath.row == 2){
//        JDyuanhuanController *jd = [[JDyuanhuanController alloc] init];
//        [self.navigationController pushViewController:jd animated:YES];
//    }else if (indexPath.row == 3){
//        FZyuanhuanController *jd = [[FZyuanhuanController alloc] init];
//        [self.navigationController pushViewController:jd animated:YES];
//    }else if (indexPath.row == 4){
//        JDzhuzhuangController *jd = [[JDzhuzhuangController alloc] init];
//        [self.navigationController pushViewController:jd animated:YES];
//    }else if (indexPath.row == 5){
//        FZzhuzhuangController *jd = [[FZzhuzhuangController alloc] init];
//        [self.navigationController pushViewController:jd animated:YES];
//    }
    
}

    
    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
