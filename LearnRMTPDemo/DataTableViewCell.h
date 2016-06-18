//
//  DataTableViewCell.h
//  LearnRMTPDemo
//
//  Created by Heige on 16/6/18.
//  Copyright © 2016年 Heige. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieRMTPLives.h"

@interface DataTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icon_img;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *city;
@property (weak, nonatomic) IBOutlet UILabel *Online_num;
@property (weak, nonatomic) IBOutlet UIImageView *cover_img;
-(void)setModelWithData:(MovieRMTPLives*)data;
@end
