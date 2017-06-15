//
//  XZLaunchTool.h
//  LanuchXib
//
//  Created by xiaozuan on 2017/6/13.
//  Copyright © 2017年 xiaozuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XZLaunchTool : NSObject

+ (BOOL)isExist;

+ (void)getAdvertisingImageWithImageUrl:(NSString *)imageUrl;

+ (NSString *)getFilePathWithImageName:(NSString *)imageName;
@end
