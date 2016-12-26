//
//  JLListTitleModule.m
//  JLModularityKit
//
//  Created by Julian Song on 16/12/26.
//  Copyright © 2016年 SongJunliang. All rights reserved.
//

#import "JLListTitleModule.h"

@implementation JLListTitleModule

- (void)onStart
{
    [super onStart];
    self.cell.textLabel.text = @"共计30条记录";
}

@end
