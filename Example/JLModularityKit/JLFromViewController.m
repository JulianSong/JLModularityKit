//
//  JLJLFromViewController.m
//  JLModularityKit
//
//  Created by Julian Song on 16/12/26.
//  Copyright © 2016年 SongJunliang. All rights reserved.
//

#import "JLFromViewController.h"
#import "JLFromNameModule.h"
#import "JLFromCountModule.h"

#import "JLFromTimeModule.h"
#import "JLFromCustomNameModule.h"
#import "JLFromCustomPhoneModule.h"
@interface JLFromViewController ()
@property(nonatomic,strong)UIView *btnContentView;
@property(nonatomic,strong)UILabel *priceLabel;
@property(nonatomic,strong)UIButton *btn;
@end

@implementation JLFromViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnContentView = [[UIView alloc] init];
    self.btnContentView.backgroundColor = [UIColor whiteColor];
    self.btnContentView.layer.shadowOffset = CGSizeMake(0,-4);
    self.btnContentView.layer.shadowRadius = 0.8;
    self.btnContentView.layer.shadowOpacity = 0.1;
    self.btnContentView.layer.shadowColor = [[UIColor colorWithWhite:0 alpha:0.5] CGColor];
    
    self.priceLabel = [[UILabel alloc] init];
    self.priceLabel.text = @"￥1200";
    self.priceLabel.font = [UIFont systemFontOfSize:30];
    self.priceLabel.textColor = self.btnContentView.tintColor;
    [self.btnContentView addSubview:self.priceLabel];
    self.btn = [[UIButton alloc] init];
    self.btn.backgroundColor = self.btnContentView.tintColor;
    [self.btnContentView addSubview:self.btn];
    [self.btn setTitle:@"Booking" forState:UIControlStateNormal];
    [self.view addSubview:self.btnContentView];
}

- (NSArray *)setupModuleNames
{
    return @[@[[JLFromNameModule class],[JLFromCountModule class]],
             @[[JLFromTimeModule class],[JLFromCustomNameModule class],[JLFromCustomPhoneModule class]]
             ];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.tableView.frame = CGRectMake(0,0,CGRectGetWidth(self.view.bounds),CGRectGetHeight(self.view.bounds) - 60);
    self.btnContentView.frame = CGRectMake(0, CGRectGetHeight(self.view.bounds) - 60, CGRectGetWidth(self.view.bounds) ,60);
    self.priceLabel.frame = CGRectMake(30,0,100,60);
    self.btn.frame = CGRectMake(CGRectGetWidth(self.view.bounds) - 120,0,120,60);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
