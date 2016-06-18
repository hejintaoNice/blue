//
//  TableViewDataSource.h
//  HJTMVVM
//
//  Created by Heige on 16/6/16.
//  Copyright © 2016年 Heige. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TableViewDataSource : NSObject<UITableViewDataSource>
@property (nonatomic,strong) NSArray *array;
@end
