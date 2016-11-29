//
//  JLFFMBPlayer.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/11/21.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "JLFFMBPlayer.h"

@interface JLFFMBPlayer ()
@property (nonatomic, strong) JLMovieObject *video;
@property (nonatomic, strong) UIButton *playBtn;
@property (nonatomic, strong) UIImageView *playImage;
@end

@implementation JLFFMBPlayer

+ (instancetype)JLFFMBPlayer: (CGRect)frame{

    static JLFFMBPlayer *player = nil;
    if (player == nil) {
        player = [[JLFFMBPlayer alloc] initWithFrame:frame];
    }
    return player;
}

- (id) initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        [self creatSubView];
    }
    return self;
}

- (void)creatSubView{

    self.playImage = [[UIImageView alloc] initWithFrame:self.frame];
    [self addSubview:self.playImage];
    
    self.playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.playBtn setTitle:@"点击播放" forState:UIControlStateNormal];
    [self.playBtn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [self.playBtn addTarget:self action:@selector(playVideo) forControlEvents:UIControlEventTouchUpInside];
    self.playBtn.frame = CGRectMake(0, 600, kScreenWidth, 100);
    [self addSubview:self.playBtn];
}

- (void)playVithVideoUrl{

    //播放网络视频
    self.video = [[JLMovieObject alloc] initWithVideo:@"http://live.hkstv.hk.lxdns.com/live/hks/playlist.m3u8"];
    
}


- (void)setMovieUrlPath:(NSString *)movieUrlPath{

    _movieUrlPath = movieUrlPath;
    [self playVithVideoUrl];
}

- (void)playVideo{
    
    //    [self.playBtn setEnabled:NO];
    [self.video seekTime:0.0];
    
    [NSTimer scheduledTimerWithTimeInterval: 1 / self.video.fps
                                     target:self
                                   selector:@selector(player:)
                                   userInfo:nil
                                    repeats:YES];
    
}

- (void)player:(NSTimer *)timer {
    
    if (![self.video stepFrame]) {
        [timer invalidate];
        return;
    }
    self.playImage.image = self.video.currentImage;
}



@end
