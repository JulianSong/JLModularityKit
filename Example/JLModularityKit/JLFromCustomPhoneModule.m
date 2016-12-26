//
//  JLFromCustomPhoneModule.m
//  JLModularityKit
//
//  Created by Julian Song on 16/12/26.
//  Copyright © 2016年 SongJunliang. All rights reserved.
//

#import "JLFromCustomPhoneModule.h"

@implementation JLFromCustomPhoneModule
- (void)onStart
{
    [super onStart];
    self.cell.textLabel.text = @"入住人手机";
    self.cell.detailTextLabel.text = @"19000000";
}
@end
