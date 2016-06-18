//
//  TableViewDelegate.h
//  HJTMVVM
//
//  Created by Heige on 16/6/16.
//  Copyright © 2016年 Heige. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void(^CellSelectedBlock)(id obj);
@interface TableViewDelegate : NSObject<UITableViewDelegate>
@property (strong,nonatomic) NSArray *array;
@property (strong,nonatomic) CellSelectedBlock cellSelectedBlock;

@end
