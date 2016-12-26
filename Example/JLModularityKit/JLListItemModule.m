//
//  JLListItemModule.m
//  JLModularityKit
//
//  Created by Julian Song on 16/12/26.
//  Copyright © 2016年 SongJunliang. All rights reserved.
//

#import "JLListItemModule.h"

@implementation JLListItemModule

- (NSInteger)numberOfRows
{
    return 30;
}

- (UITableViewCell *)cellForIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:[self reuseIdentifier:indexPath]];
    return cell;
}

- (void)didAddCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.text =[NSString stringWithFormat:@"条目%ld",(long)indexPath.row];
}
@end
