//
//  UIViewController+changeNavBarItem.h
//  HJTMVVM
//
//  Created by Heige on 16/6/16.
//  Copyright © 2016年 Heige. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (changeNavBarItem)<UIGestureRecognizerDelegate>

- (void)hideTabbar;

- (void)showTabBar;

- (void)changeNaviBar;

- (void)slideBack;

@end
