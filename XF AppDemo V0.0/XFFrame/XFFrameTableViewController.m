//
//  XFFrameTableViewController.m
//  XF AppDemo V0.0
//
//  Created by po on 15/10/14.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFFrameTableViewController.h"
#import "XFFrameTableViewControllerCell.h"

@implementation XFFrameTableViewController

- (instancetype)init
{
    if (self = [super init]) {
        _refreshMode = XFFrameTableViewControllerRefeshModeNone;
        _sectionsNumber = 1;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor colorWithRed:(245 / 255.0) green:(245 / 255.0) blue:(245 / 255.0) alpha:1];
    
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    
    [self setupRefreshMode];
    
}

- (void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    
    [self.tableView reloadData];
    [self.tableView registerClass:self.cellClass forCellReuseIdentifier:[self.cellClass description]];
}

- (void)setRefreshMode:(XFFrameTableViewControllerRefeshMode)refreshMode
{
    _refreshMode = refreshMode;
    
    [self setupRefreshMode];
}

- (void)setupRefreshMode
{
    switch (_refreshMode) {
        case XFFrameTableViewControllerRefeshModeNone:
        {
            ;
        }
            break;
            
        case XFFrameTableViewControllerRefeshModeHeaderRefresh:
        {
            UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
            [refresh addTarget:self action:@selector(pullDownRefreshOperation) forControlEvents:UIControlEventValueChanged];
            self.refreshControl = refresh;
        }
            break;
            
        case XFFrameTableViewControllerRefeshModeFooterRefresh:
        {
            
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionsNumber;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger number = (self.sectionsNumber == 1) ? self.dataArray.count : [self.dataArray[section] count];
    return number;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XFFrameTableViewControllerCell *cell = [tableView dequeueReusableCellWithIdentifier:[self.cellClass description]];
    if (!cell) {
        cell = [[self.cellClass alloc] init];
    }
    if (self.sectionsNumber == 1) {
        cell.model = self.dataArray[indexPath.row];
    } else if (self.sectionsNumber > 1){
        cell.model = [self.dataArray[indexPath.section] objectAtIndex:indexPath.row];
    }
    return cell;
}

#pragma mark - funcs for subControllers rewrite

- (void)pullDownRefreshOperation
{
    
}

@end