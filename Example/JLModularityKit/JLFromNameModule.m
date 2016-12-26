//
//  JLFromNameModule.m
//  JLModularityKit
//
//  Created by Julian Song on 16/12/26.
//  Copyright © 2016年 SongJunliang. All rights reserved.
//

#import "JLFromNameModule.h"

@implementation JLFromNameModule

- (void)onStart
{
    [super onStart];
    self.cell.textLabel.text = @"酒店名称";
    self.cell.detailTextLabel.text = @"哇哈哈大酒店";
}

@end
