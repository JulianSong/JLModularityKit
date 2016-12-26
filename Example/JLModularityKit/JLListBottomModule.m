//
//  JLListBottomModule.m
//  JLModularityKit
//
//  Created by Julian Song on 16/12/26.
//  Copyright © 2016年 SongJunliang. All rights reserved.
//

#import "JLListBottomModule.h"
@interface JLListBottomModule()
@property(nonatomic,strong)UIView *contentView;
@property(nonatomic,strong)UIButton *btn;
@end
@implementation JLListBottomModule
- (void)onStart
{
    self.contentView = [[UIView alloc] init];
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.layer.shadowOffset = CGSizeMake(0,-4);
    self.contentView.layer.shadowRadius = 0.8;
    self.contentView.layer.shadowOpacity = 0.1;
    self.contentView.layer.shadowColor = [[UIColor colorWithWhite:0 alpha:0.5] CGColor];
    self.btn = [[UIButton alloc] init];
    self.btn.backgroundColor = self.contentView.tintColor;
    [self.contentView addSubview:self.btn];
    self.btn.layer.cornerRadius = 20.0f;
    [self.btn setTitle:@"Do Something" forState:UIControlStateNormal];
    self.btn.frame = CGRectMake(10,10,CGRectGetWidth(self.moduleContainer.view.bounds) - 20,40);
}
- (BOOL)isFooter
{
    return YES;
}

- (CGFloat)headerOrFooterViewHeightForSection:(NSInteger)section
{
    return 60;
}
- (UIView *)headerOrFooterViewForSection:(NSInteger)section
{
    return self.contentView;
}
@end
