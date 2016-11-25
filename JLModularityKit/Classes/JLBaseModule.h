//
//  JLAppDelegate.m
//  JLModularityKit
//
//  Created by SongJunliang on 11/25/2016.
//  Copyright (c) 2016 SongJunliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JLModuleContainer.h"
@interface JLBaseModule : NSObject
@property(nonatomic,weak,readonly)UITableViewController <JLModuleContainer> *moduleContainer;
@property(nonatomic,weak) id commonViewModel;
@property(nonatomic,strong) UITableViewCell *cell;

- (BOOL)shouldShow;
- (void)onStart;
- (void)didSetViewModel;
- (void)didAddCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath;
- (void)willDisplayCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath;
- (void)didEndDisplayingCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath;
- (void)didSelect:(NSIndexPath *)indexPath;
- (void)onEnd;

- (CGFloat)height:(NSIndexPath *)indexPath;
- (NSString *)reuseIdentifier:(NSIndexPath *)indexPath;

- (void)reloadModules;
@end

@interface JLBaseModule(MutableRow)

- (NSInteger)numberOfRows;
- (UITableViewCell *)cellForIndexPath:(NSIndexPath *)indexPath;
@end

@interface JLBaseModule(SectionHeaderFooter)
- (BOOL)isHeader;
- (BOOL)isFooter;
- (UIView *)headerOrFooterViewForSection:(NSInteger )section;
- (CGFloat)headerOrFooterViewHeightForSection:(NSInteger )section;
@end
@interface JLBaseModule(Communicate)
- (void)sendMsg:(id)msg to:(Class) receiver callBack:(void (^)(id msg))callBack;
- (void)getMsg:(id)msg reply:(void (^)(id msg))reply;
@end
