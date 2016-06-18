//
//  CustomTool.h
//  HJTMVVM
//
//  Created by Heige on 16/6/16.
//  Copyright © 2016年 Heige. All rights reserved.
//

#ifndef CustomTool_h
#define CustomTool_h
#define WS __weak typeof(self) weakSelf = self;
#define SS __strong typeof(self) strongSelf = weakSelf;

#define HEIGHT_HALF(view) view.frame.size.height / 2;

#define GPSET(obj,key) [[NSUserDefaults standardUserDefaults] setObject:obj forKey:key];\
[[NSUserDefaults standardUserDefaults] synchronize];
#define GPGET(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]
#define VerSion [[[UIDevice currentDevice] systemVersion] floatValue]
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height


#define filePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]

#endif 
