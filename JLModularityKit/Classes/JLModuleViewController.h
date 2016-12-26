//
//  JLModuleViewController.h
//  Pods
//
//  Created by Julian Song on 16/12/26.
//
//

#import <UIKit/UIKit.h>
#import "JLModuleContainer.h"
@interface JLModuleViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,JLModuleContainer>
@property(nonatomic,strong)UITableView *tableView;
- (instancetype)initWithViewModel:(id)viewModel;
@end
