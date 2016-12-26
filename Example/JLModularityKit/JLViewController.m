//
//  JLViewController.m
//  JLModularityKit
//
//  Created by SongJunliang on 11/25/2016.
//  Copyright (c) 2016 SongJunliang. All rights reserved.
//

#import "JLViewController.h"
#import "JLFromViewController.h"
#import "JLListViewController.h"
@interface JLViewController ()

@end

@implementation JLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        JLFromViewController *fVC = [[JLFromViewController alloc] init];
        fVC.title = @"表单页面";
        [self.navigationController pushViewController:fVC animated:YES];
    }
    
    if (indexPath.row == 1) {
        JLListViewController *lVC = [[JLListViewController alloc] initWithStyle:UITableViewStylePlain];
        lVC.title = @"列表页面";
        [self.navigationController pushViewController:lVC animated:YES];
    }
    
}
@end
