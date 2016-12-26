//
//  JLFromCustomName.m
//  JLModularityKit
//
//  Created by Julian Song on 16/12/26.
//  Copyright © 2016年 SongJunliang. All rights reserved.
//

#import "JLFromCustomNameModule.h"

@implementation JLFromCustomNameModule
- (void)onStart
{
    [super onStart];
    self.cell.textLabel.text = @"入住人姓名";
    self.cell.detailTextLabel.text = @"超级玛丽";
}
@end
