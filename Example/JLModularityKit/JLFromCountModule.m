//
//  JLFromCountModule.m
//  JLModularityKit
//
//  Created by Julian Song on 16/12/26.
//  Copyright © 2016年 SongJunliang. All rights reserved.
//

#import "JLFromCountModule.h"

@implementation JLFromCountModule

- (void)onStart
{
    [super onStart];
    self.cell.textLabel.text = @"房间数量";
    self.cell.detailTextLabel.text = @"10 间";
}

@end
