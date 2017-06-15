//
//  XZLaunchView.h
//  LanuchXib
//
//  Created by xiaozuan on 2017/6/13.
//  Copyright © 2017年 xiaozuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kscreenWidth [UIScreen mainScreen].bounds.size.width
#define kscreenHeight [UIScreen mainScreen].bounds.size.height
#define kUserDefaults [NSUserDefaults standardUserDefaults]
static NSString *const adImageName = @"adImageName";
static NSString *const adUrl = @"adUrl";

@interface XZLaunchView : UIView

/** 显示广告页面方法*/
- (void)show;

/** 图片路径*/
@property (nonatomic, copy) NSString *filePath;


@end
