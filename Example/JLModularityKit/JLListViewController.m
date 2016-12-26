//
//  JLListViewController.m
//  JLModularityKit
//
//  Created by Julian Song on 16/12/26.
//  Copyright © 2016年 SongJunliang. All rights reserved.
//

#import "JLListViewController.h"
#import "JLListTitleModule.h"
#import "JLListItemModule.h"
#import "JLListBottomModule.h"
@interface JLListViewController ()

@end

@implementation JLListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSArray *)setupModuleNames
{
    return @[@[[JLListTitleModule class]],
             @[[JLListItemModule class],[JLListBottomModule class]]];
}
@end
