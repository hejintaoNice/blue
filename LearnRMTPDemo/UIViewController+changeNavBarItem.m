//
//  UIViewController+changeNavBarItem.m
//  HJTMVVM
//
//  Created by Heige on 16/6/16.
//  Copyright © 2016年 Heige. All rights reserved.
//

#import "UIViewController+changeNavBarItem.h"

@implementation UIViewController (changeNavBarItem)
- (void)hideTabbar{
    if ([self.navigationController.tabBarController.tabBar isHidden]) {
        return;
    }
    
    CGRect frame = self.navigationController.tabBarController.tabBar.frame;
    CGRect newFrame = CGRectMake(frame.origin.x, [[UIScreen mainScreen] bounds].size.height, frame.size.width, frame.size.height);
    [UIView animateWithDuration:0.3 animations:^{
        [self.navigationController.tabBarController.tabBar setFrame:newFrame];
    } completion:^(BOOL finshed){
        [self.navigationController.tabBarController.tabBar setHidden:YES];
    }];
}

- (void)showTabBar
{
    if (![self.navigationController.tabBarController.tabBar isHidden]) {
        return;
    }
    [self.navigationController.tabBarController.tabBar setHidden:NO];
    CGRect frame = self.navigationController.tabBarController.tabBar.frame;
    CGRect newFrame = CGRectMake(frame.origin.x, [UIScreen mainScreen].bounds.size.height - 49, frame.size.width, frame.size.height);
    
    [UIView animateWithDuration:0.4 animations:^{
        [self.navigationController.tabBarController.tabBar setFrame:newFrame];
    } completion:^(BOOL finshed){
        
    }];
}

- (void)changeNaviBar
{
    self.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1]];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
}

- (void)slideBack
{
    if ([self.navigationController       respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
    if ([self.navigationController   respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        if ([self.navigationController.viewControllers count] == 2) {
            self.navigationController.interactivePopGestureRecognizer.delegate = self;
        }
    }
}
@end
