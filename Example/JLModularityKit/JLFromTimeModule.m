//
//  JLFromTimeModule.m
//  JLModularityKit
//
//  Created by Julian Song on 16/12/26.
//  Copyright © 2016年 SongJunliang. All rights reserved.
//

#import "JLFromTimeModule.h"

@implementation JLFromTimeModule
- (void)onStart
{
    [super onStart];
    self.cell.textLabel.text = @"入住时间";
    self.cell.detailTextLabel.text = @"2016年12月31号-2017年1月2号";
}

@end
