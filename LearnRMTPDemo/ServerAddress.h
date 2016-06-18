//
//  ServerAddress.h
//  HJTMVVM
//
//  Created by Heige on 16/6/16.
//  Copyright © 2016年 Heige. All rights reserved.
//

#ifndef ServerAddress_h
#define ServerAddress_h


#define NetworkServer   @"http://service.ingkee.com/api"


#define GetData    @"/live/gettop?imsi=&uid=17800399&proto=5&idfa=A1205EB8-0C9A-4131-A2A2-27B9A1E06622&lc=0000000000000026&cc=TG0001&imei=&sid=20i0a3GAvc8ykfClKMAen8WNeIBKrUwgdG9whVJ0ljXi1Af8hQci3&cv=IK3.1.00_Iphone&devi=bcb94097c7a3f3314be284c8a5be2aaeae66d6ab&conn=Wifi&ua=iPhone&idfv=DEBAD23B-7C6A-4251-B8AF-A95910B778B7&osversion=ios_9.300000&count=5&multiaddr=1"

//---------------------------SVProgressHUD--------
//#define SHOW_ERROR [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",[[responseObject objectForKey:@"msg"] isEqual:[NSNull null]] ? @"不好意思，出错啦-.-" : [responseObject objectForKey:@"msg"]] maskType:SVProgressHUDMaskTypeGradient];
#define SHOW_ERROR [SVProgressHUD showErrorWithStatus:@"出错了"];
#define SHOW_NTERROR [SVProgressHUD showErrorWithStatus:@"网络在开小差哦~\(≧▽≦)/~"];
#define SHOW_STATUS [SVProgressHUD showWithStatus:@"请稍等..." maskType:SVProgressHUDMaskTypeGradient];
#define SHOW_HIDDEN [SVProgressHUD dismiss];

#endif /* ServerAddress_h */
