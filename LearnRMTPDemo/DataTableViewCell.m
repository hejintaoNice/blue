//
//  DataTableViewCell.m
//  LearnRMTPDemo
//
//  Created by Heige on 16/6/18.
//  Copyright © 2016年 Heige. All rights reserved.
//

#import "DataTableViewCell.h"
#import "MovieRMTPCreator.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation DataTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _icon_img.layer.cornerRadius = _icon_img.layer.frame.size.height/2;
    _icon_img.clipsToBounds = YES;
    
    _cover_img.contentMode = UIViewContentModeScaleAspectFill;
    _cover_img.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _cover_img.clipsToBounds = YES;
}

-(void)setModelWithData:(MovieRMTPLives *)data{
    [_icon_img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.meelive.cn/%@",data.creator.portrait]]];
    [_cover_img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.meelive.cn/%@",data.creator.portrait]]placeholderImage:[UIImage imageNamed:@"PlaceHolder"]];
    
    _name.text = data.creator.nick;
    if ([data.city isEqualToString:@""]) {
        _city.text = @"难道在火星?";
    }else{
        _city.text = data.city;
    }
    
    
    _Online_num.text = [NSString stringWithFormat:@"%.f人正在观看",data.onlineUsers];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
