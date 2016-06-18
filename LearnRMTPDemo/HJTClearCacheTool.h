//
//  HJTClearCacheTool.h
//  HJTMVVM
//
//  Created by Heige on 16/6/16.
//  Copyright © 2016年 Heige. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJTClearCacheTool : NSObject
/**
 *  获得path路径文件夹的大小
 */
+(NSString *)getCacheSizeWithFilePath:(NSString *)path;
/**
 *  清楚path路径文件夹的缓存
 */
+ (BOOL)clearCacheWithFilePath:(NSString *)path;
@end
