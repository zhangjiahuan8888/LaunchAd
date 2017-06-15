//
//  XZLaunchView.m
//  LanuchXib
//
//  Created by xiaozuan on 2017/6/13.
//  Copyright © 2017年 xiaozuan. All rights reserved.
//

#import "XZLaunchView.h"
@interface XZLaunchView()
@property (nonatomic, strong) UIImageView *bgView;

@property (nonatomic, strong) UIImageView *adView;

@property (nonatomic, strong) UIButton *countBtn;

@property (nonatomic, strong) NSTimer *countTimer;

@property (nonatomic, assign) int count;
@end

// 广告显示的时间
static int const showtime = 5;

@implementation XZLaunchView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 0.背景图
        _bgView = [[UIImageView alloc] initWithFrame:frame];
        _bgView.userInteractionEnabled = YES;
        _bgView.contentMode = UIViewContentModeScaleAspectFill;
        _bgView.image = [UIImage imageNamed:@"着陆页-750*1334"];
        
        // 1.广告图片
        _adView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height-200)];
        _adView.userInteractionEnabled = YES;
        
        _adView.contentMode = UIViewContentModeScaleAspectFill;
        _adView.clipsToBounds = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToAd)];
        [_adView addGestureRecognizer:tap];
        
        // 2.跳过按钮
        CGFloat btnW = 60;
        CGFloat btnH = 30;
        _countBtn = [[UIButton alloc] initWithFrame:CGRectMake(kscreenWidth - btnW - 24, btnH, btnW, btnH)];
        [_countBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [_countBtn setTitle:[NSString stringWithFormat:@"跳过%d", showtime] forState:UIControlStateNormal];
        _countBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_countBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _countBtn.backgroundColor = [UIColor colorWithRed:38 /255.0 green:38 /255.0 blue:38 /255.0 alpha:0.6];
        _countBtn.layer.cornerRadius = 4;
        
        [self addSubview:_bgView];
        [self addSubview:_adView];
        [self addSubview:_countBtn];
        
    }
    return self;
}
- (void)setFilePath:(NSString *)filePath
{
    NSLog(@"filePath   %@",filePath);
    _filePath = filePath;
    _adView.image = [UIImage imageWithContentsOfFile:filePath];
}

- (void)show{
    [self startTimer];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
}
// 定时器倒计时
- (void)startTimer
{
    _count = showtime;
    [[NSRunLoop mainRunLoop] addTimer:self.countTimer forMode:NSRunLoopCommonModes];
}
- (NSTimer *)countTimer
{
    if (!_countTimer) {
        _countTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    }
    return _countTimer;
}
- (void)countDown
{
    _count --;
    [_countBtn setTitle:[NSString stringWithFormat:@"跳过%d",_count] forState:UIControlStateNormal];
    if (_count == 0) {
        
        [self dismiss];
    }
}

// 移除广告页面
- (void)dismiss
{
    [self.countTimer invalidate];
    self.countTimer = nil;
    
    [UIView animateWithDuration:0.3f animations:^{
        
        self.alpha = 0.f;
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
}
- (void)pushToAd{
    
    [self dismiss];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pushtoad" object:nil userInfo:nil];
}

@end
