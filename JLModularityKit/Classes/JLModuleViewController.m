//
//  JLModuleViewController.m
//  Pods
//
//  Created by Julian Song on 16/12/26.
//
//

#import "JLModuleViewController.h"
#import "JLBaseModule.h"
#import "JLBaseModule_Private.h"
@interface JLModuleViewController ()
@property (nonatomic,strong) NSMutableArray *modules;
@property (nonatomic,strong) NSMutableArray *showingModules;
@property (nonatomic,strong) NSMutableDictionary *showingSectionHeaderModules;
@property (nonatomic,strong) NSMutableDictionary *showingSectionFooterModules;
@property (nonatomic,strong) NSArray *moduleNames;
@end

@implementation JLModuleViewController
@synthesize viewModel = _viewModel;

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    if (self = [super init]) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:style];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _moduleNames = [self setupModuleNames];
        _modules     = [[NSMutableArray alloc] init];
        _showingSectionHeaderModules     = [[NSMutableDictionary alloc] init];
        _showingSectionFooterModules     = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style withViewModel:(id)viewModel
{
    if (self = [super init]) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:style];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _viewModel = viewModel;
        _moduleNames = [self setupModuleNames];
        _modules     = [[NSMutableArray alloc] init];
        _showingSectionHeaderModules     = [[NSMutableDictionary alloc] init];
        _showingSectionFooterModules     = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (instancetype)init
{
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (instancetype)initWithViewModel:(id)viewModel
{
    return [self initWithStyle:UITableViewStyleGrouped withViewModel:viewModel];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.frame;
    for (NSArray *nameSection in self.moduleNames) {
        NSMutableArray *muduleSection = [[NSMutableArray alloc] init];
        for (Class class in nameSection) {
            JLBaseModule *module = [[class alloc] init];
            module.moduleContainer = self;
            [module onStart];
            [muduleSection addObject:module];
        }
        [self.modules addObject:muduleSection];
    }
    [self reloadModules];
}

- (NSArray *)setupModuleNames
{
    return @[];
}

- (void)reloadModules
{
    self.showingModules = [[NSMutableArray alloc] init];
    self.showingSectionHeaderModules     = [[NSMutableDictionary alloc] init];
    self.showingSectionFooterModules     = [[NSMutableDictionary alloc] init];
    NSInteger sectionIndex = 0;
    for (NSArray *secion in self.modules) {
        NSMutableArray *showingSection = [[NSMutableArray alloc] init];
        BOOL hasSectionHeaderOrFooter = NO;
        for (JLBaseModule  *module in secion) {
            if (module.commonViewModel == nil && self.viewModel != nil) {
                [module setCommonViewModel:self.viewModel];
                [module didSetViewModel];
                
            }
            if ([module shouldShow]) {
                if ([module isHeader]) {//section header
                    hasSectionHeaderOrFooter = YES;
                    [self.showingSectionHeaderModules setObject:module forKey:[NSString stringWithFormat:@"header@%@",@(sectionIndex)]];
                }else if([module isFooter]){//section footer
                    hasSectionHeaderOrFooter = YES;
                    [self.showingSectionFooterModules setObject:module forKey:[NSString stringWithFormat:@"footer@%@",@(sectionIndex)]];
                }else{//section cell
                    for (NSInteger i = 0; i < [module numberOfRows]; i ++) {
                        [showingSection addObject:module];
                    }
                }
            }
        }
        if (showingSection.count > 0 || hasSectionHeaderOrFooter) {
            [self.showingModules addObject:showingSection];
        }
        sectionIndex ++;
    }
    [self.tableView reloadData];
}

- (JLBaseModule *)moduleFromeClase:(Class)moduleClass
{
    JLBaseModule *module = [[moduleClass alloc] init];
    return module;
}

- (void)sendMsg:(id)msg to:(Class)receiver callBack:(void (^)(id))callBack
{
    for (NSArray *secion in self.modules) {
        for (JLBaseModule *m in secion) {
            if ([m isKindOfClass:receiver]) {
                [m getMsg:msg reply:callBack];
                break;
            }
        }
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.showingModules.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.showingModules[section] count];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    JLBaseModule *module = [self.showingSectionHeaderModules objectForKey:[NSString stringWithFormat:@"header@%@",@(section)]];
    return [module headerOrFooterViewForSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JLBaseModule *module = self.showingModules[indexPath.section][indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[module reuseIdentifier:indexPath]];
    if (cell == nil) {
        cell = [module cellForIndexPath:indexPath];
    }
    [module didAddCell:cell forIndexPath:indexPath];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    JLBaseModule *module = [self.showingSectionFooterModules objectForKey:[NSString stringWithFormat:@"footer@%@",@(section)]];
    return [module headerOrFooterViewForSection:section];
}


#pragma mark - Table view data delegate

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JLBaseModule *module = self.showingModules[indexPath.section][indexPath.row];
    return [module height:indexPath];
}

- (CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    JLBaseModule *module = [self.showingSectionHeaderModules objectForKey:[NSString stringWithFormat:@"header@%@",@(section)]];
    if (module == nil) {
        return 20;
    }
    return [module headerOrFooterViewHeightForSection:section];
}

- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    JLBaseModule *module = [self.showingSectionFooterModules objectForKey:[NSString stringWithFormat:@"footer@%@",@(section)]];
    if (module == nil) {
        return 0.1;
    }
    return [module headerOrFooterViewHeightForSection:section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JLBaseModule *module = self.showingModules[indexPath.section][indexPath.row];
    [module didSelect:indexPath];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    JLBaseModule *module = self.showingModules[indexPath.section][indexPath.row];
    [module willDisplayCell:cell forIndexPath:indexPath];
}
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath
{
    //    IABaseModule *module = self.showingModules[indexPath.section][indexPath.row];
    //    [module didEndDisplayingCell:cell forIndexPath:indexPath];
}

@end
