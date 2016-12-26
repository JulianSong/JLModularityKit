//
//  JLAppDelegate.m
//  JLModularityKit
//
//  Created by SongJunliang on 11/25/2016.
//  Copyright (c) 2016 SongJunliang. All rights reserved.
//

#import "JLBaseModule.h"
#import "JLBaseModule_Private.h"
@interface JLBaseModule()
@end
@implementation JLBaseModule
- (instancetype)init
{
    if (self = [super init]) {

    }
    return self;
}

- (BOOL)shouldShow
{
    return YES;
}

- (void)onStart
{
    self.cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NSStringFromClass([self class])];
}

- (void)didSetViewModel
{
    
}

- (void)didAddCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath;
{
    
}

- (void)willDisplayCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)didEndDisplaying:(NSIndexPath *)indexPath
{
    
}

- (void)didEndDisplayingCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)didSelect:(NSIndexPath *)indexPath
{
    
}

- (void)onEnd
{
    
}

- (CGFloat)height:(NSIndexPath *)indexPath
{
    return 44.0f;
}


- (NSString *)reuseIdentifier:(NSIndexPath *)indexPath
{
    return NSStringFromClass([self class]);
}

- (void)reloadModules
{
    [self.moduleContainer reloadModules];
}

#pragma mark - SectionHeaderFooter

- (NSInteger)numberOfRows
{
    return 1;
}
- (UITableViewCell *)cellForIndexPath:(NSIndexPath *)indexPath
{
    return self.cell;
}

#pragma mark - SectionHeaderFooter

- (BOOL)isHeader
{
    return NO;
}
- (BOOL)isFooter
{
    return NO;
}

- (UIView *)headerOrFooterViewForSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)headerOrFooterViewHeightForSection:(NSInteger)section
{
    return 0;
}

#pragma mark - Communicate

- (void)sendMsg:(id)msg to:(Class)receiver callBack:(void (^)(id))callBack
{
    [self.moduleContainer sendMsg:msg to:receiver callBack:callBack];
}
@end
