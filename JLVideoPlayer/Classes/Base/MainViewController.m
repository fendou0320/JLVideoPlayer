//
//  MainViewController.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/10/14.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "MainViewController.h"

#import "DownLoadViewController.h"
#import "HuDongViewController.h"
#import "LanMuViewController.h"
#import "LiveViewController.h"
#import "MineViewController.h"
#import "TuiJianViewController.h"
#import "OtherViewController.h"

#import "BaseNavViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RandomColor;
    [self creatSubViewCtr];
    [self removeTabbar];
    [self creatTabbar];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)creatSubViewCtr{
   
    //创建第三级控制器
    DownLoadViewController *xiazai = [[DownLoadViewController alloc] init];
    xiazai.navigationItem.title = @"下载";
    
    //创建第三级控制器
    HuDongViewController *hudong = [[HuDongViewController  alloc] init];
    hudong.navigationItem.title = @"互动";

    //创建第三级控制器
    LanMuViewController *lanmu = [[LanMuViewController alloc] init];
    lanmu.navigationItem.title = @"栏目";

    //创建第三级控制器
    LiveViewController *live = [[LiveViewController alloc] init];
    live.navigationItem.title = @"直播";

    //创建第三级控制器
    MineViewController *mine = [[MineViewController alloc] init];
    mine.navigationItem.title = @"我的";

    //创建第三级控制器
    TuiJianViewController *tuijian = [[TuiJianViewController alloc] init];
    tuijian.navigationItem.title = @"推荐";
    
    //创建第三级控制器
    OtherViewController *other = [[OtherViewController alloc] init];
    other.navigationItem.title = @"其他";

    NSArray *ctrls =@[tuijian,live,lanmu,hudong,mine,xiazai,other];

    //存储导航控制器
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    
    for (UIViewController *ctrl in ctrls) {
        
        //1.创建导航控制器(子类化导航控制器)
        BaseNavViewController *nav = [[BaseNavViewController alloc] initWithRootViewController:ctrl];
        //2.把导航控制器加入到数组中
        [array addObject:nav];
    }
    //把导航控制器交给标签控制器管理
    self.viewControllers = array;
}


- (void)removeTabbar{

    for (UIView *view in self.tabBar.subviews) {
        Class c = NSClassFromString(@"UITabBarButton");
        //判断view是不是由UITabBarButton类创建
        if ([view isKindOfClass:c]) {
            [view removeFromSuperview];
        }
    }
}


- (void)creatTabbar{

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.tabBar.bounds];
    imageView.image = [UIImage imageNamed:@"tab_bg_all.png"];
    [self.tabBar addSubview:imageView];
    
    NSArray *imageNames = @[@"course_normal",@"course_normal",@"course_normal",@"course_normal",@"course_normal",@"course_normal",@"course_normal"];//me_selected
//    NSArray *imageSelectNames = @[@"course_selected",@"course_selected",@"course_selected",@"course_selected",@"course_selected",@"course_selected",@"course_selected"];

    
    NSArray *titles = @[@"推荐",@"直播",@"栏目",@"互动",@"我的",@"下载",@"other"];
    
    //创建选中视图
    selectImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"course_selected.png"]];
    
    selectImg.frame = CGRectMake(0, 0, 55, 45);
    selectImg.backgroundColor = [UIColor purpleColor];
    [self.tabBar addSubview:selectImg];
    
    //按钮宽度
    CGFloat width = kScreenWidth / titles.count;
    
    for (NSInteger i = 0; i < imageNames.count; i++) {
        
        //取出图片名
        NSString *imageName  = imageNames[i];
//        NSString *selectImageName = imageSelectNames[i];
        
        //取出标题
        NSString *title =  titles[i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
//        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(i * width, 0, width, kTabBarHeight);
        btn.backgroundColor = RandomColor;
        btn.tag = i;
        
        //调整标题的位置
        btn.titleLabel.font = [UIFont systemFontOfSize:11];
        //调整图片的位置
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 20, 0);
        
        btn.titleEdgeInsets = UIEdgeInsetsMake(10, 0, 0, 30);
        [self.tabBar addSubview:btn];
        
        if (i == 0) {
         
            selectImg.center = btn.center;
        }
        [self.tabBar addSubview:btn];
    }
}

//按钮点击事件
- (void)clickAction:(UIButton *)btn{
    
    //移动选中视图
    [UIView animateWithDuration:.3 animations:^{
        
        selectImg.center = btn.center;
        
    }];
    
    //切换子控制器
    self.selectedIndex = btn.tag;
    
}



@end
