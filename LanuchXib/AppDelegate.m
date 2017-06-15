//
//  AppDelegate.m
//  LanuchXib
//
//  Created by xiaozuan on 2017/6/13.
//  Copyright © 2017年 xiaozuan. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "UIImageView+WebCache.h"
#import "XZLaunchView.h"
#import "XZLaunchTool.h"
@interface AppDelegate ()
@property (strong, nonatomic) UIView *lunchView;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    RootViewController *rootVC = [[RootViewController alloc] init];
    UINavigationController *naviVC = [[UINavigationController alloc] initWithRootViewController:rootVC];
    self.window.rootViewController = naviVC;
    

    if ([XZLaunchTool isExist]) {
        XZLaunchView *advertiseView = [[XZLaunchView alloc] initWithFrame:self.window.bounds];
        NSString *filePath = [XZLaunchTool getFilePathWithImageName:[kUserDefaults valueForKey:adImageName]];
        advertiseView.filePath = filePath;
        [advertiseView show];
    }
    
    NSArray *imageArray = @[@"http://imgsrc.baidu.com/forum/pic/item/9213b07eca80653846dc8fab97dda144ad348257.jpg",
                            @"http://pic.paopaoche.net/up/2012-2/20122220201612322865.png",
                            @"http://img5.pcpop.com/ArticleImages/picshow/0x0/20110801/2011080114495843125.jpg",
                            @"http://www.mangowed.com/uploads/allimg/130410/1-130410215449417.jpg"];
    NSString *imageUrl = imageArray[arc4random() % imageArray.count];
    [XZLaunchTool getAdvertisingImageWithImageUrl:imageUrl];
    return YES;
}



@end

