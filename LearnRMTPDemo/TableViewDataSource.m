//
//  TableViewDataSource.m
//  HJTMVVM
//
//  Created by Heige on 16/6/16.
//  Copyright © 2016年 Heige. All rights reserved.
//

#import "TableViewDataSource.h"
#import "DataTableViewCell.h"

@implementation TableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     DataTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"dataCell"];
    if (cell == nil) {
        cell = [[DataTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"dataCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setModelWithData:_array[indexPath.row]];
    return cell;
}

@end
