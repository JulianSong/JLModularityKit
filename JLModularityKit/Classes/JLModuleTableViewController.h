//
//  JLAppDelegate.m
//  JLModularityKit
//
//  Created by SongJunliang on 11/25/2016.
//  Copyright (c) 2016 SongJunliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JLModuleContainer.h"
@interface JLModuleTableViewController :UITableViewController <IAModuleContainer>
- (instancetype)initWithViewModel:(id)viewModel;
@end
