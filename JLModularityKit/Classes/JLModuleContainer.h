//
//  JLAppDelegate.m
//  JLModularityKit
//
//  Created by SongJunliang on 11/25/2016.
//  Copyright (c) 2016 SongJunliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JLModuleContainer <NSObject>
@property (nonatomic, strong)id viewModel;
- (NSArray *)setupModuleNames;
- (void)sendMsg:(id)msg to:(Class) receiver callBack:(void (^)(id msg))callBack;
- (void)reloadModules;
@end
