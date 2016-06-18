//
//  HJTNetTool.m
//  HJTMVVM
//
//  Created by Heige on 16/6/16.
//  Copyright © 2016年 Heige. All rights reserved.
//

#import "HJTNetTool.h"
#import <SVProgressHUD.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <AFNetworking.h>

@implementation HJTNetTool
- (void)dealloc
{
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                    error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

+ (NSString *)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    NSString *str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return str;
}

+ (NSDictionary *)transformation:(id)responseObject
{
    NSString *resultString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
    
#if DEBUG
    NSLog(@"**********************");
    NSLog(@"%@",resultString);
    NSLog(@"**********************");
#else
    
#endif
    
    NSData *jsonData = [resultString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    return dic;
}
+ (void)get:(nonnull NSString *)urlString progress:(nullable void(^)(NSProgress * _Nonnull progress))progressBlock success:(nullable void(^)(id _Nonnull responseObject))successBlock failure:(nullable void(^)(NSString  * _Nonnull errorLD))failureBlokc
{
    
    NSParameterAssert(urlString);
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    urlString = [NSMutableString stringWithFormat:@"%@%@",NetworkServer,urlString];
    __weak typeof(self) weakSelf = self;
    [session GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        __strong typeof(self) strongSelf = weakSelf;
        successBlock([strongSelf transformation:responseObject]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlokc(error.localizedDescription);
    }];
}

+ (void)post:(nonnull NSString *)urlString parameters:(nullable NSDictionary *)parameters progress:(nullable void(^)(NSProgress * _Nullable progress))progressBlock success:(void(^)(id _Nullable responseObject))successBlock failure:(void(^)(NSString  * _Nonnull errorLD))failureBlokc
{
    
    NSParameterAssert(urlString);
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString* mutableURLString = [NSString stringWithFormat:@"%@%@",NetworkServer,urlString];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parameters];
    __weak typeof(self) weakSelf = self;
    [session POST:mutableURLString parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock([weakSelf transformation:responseObject]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

}

@end
