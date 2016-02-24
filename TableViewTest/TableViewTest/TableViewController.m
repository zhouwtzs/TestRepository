//
//  TableViewController.m
//  TableViewTest
//
//  Created by 周文涛 on 16/2/24.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import "TableViewController.h"

@implementation TableViewController

- (id)initWithDelegate:(id<TestTabelViewDelegate>)delegate
{
    self = [super init];
    
    if (self) {
        _delegate = delegate;
        
        _dataSource = delegate.dataSource;
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 1, 1) style:UITableViewStyleGrouped];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * reusableStr = @"cellString";
    
    UITableViewCell * tableViewCell = [tableView dequeueReusableCellWithIdentifier:reusableStr];
    
    if (!tableViewCell) {
        
        tableViewCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusableStr];
    
    }
    
    tableViewCell.textLabel.text = _dataSource[indexPath.row];
    
    if (indexPath.row%2) tableViewCell.backgroundColor = [UIColor grayColor];
    
    else tableViewCell.backgroundColor = [UIColor whiteColor];
    
    return tableViewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * tableViewCell = [tableView cellForRowAtIndexPath:indexPath];
    
    tableViewCell.contentView.backgroundColor = [UIColor redColor];
    
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([self.delegate respondsToSelector:@selector(tableViewDidSelectedCellAtIndexPath:)]) {
        
        [self.delegate tableViewDidSelectedCellAtIndexPath:indexPath];
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * tableViewCell = [tableView cellForRowAtIndexPath:indexPath];
    
    tableViewCell.contentView.backgroundColor = [UIColor clearColor];
}

@end
