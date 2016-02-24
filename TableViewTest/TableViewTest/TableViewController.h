//
//  TableViewController.h
//  TableViewTest
//
//  Created by 周文涛 on 16/2/24.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TestTabelViewDelegate.h"

@interface TableViewController : NSObject<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView * tableView;

@property(nonatomic,weak)NSMutableArray * dataSource;

@property(nonatomic,weak)id<TestTabelViewDelegate>delegate;

- (id)initWithDelegate:(id<TestTabelViewDelegate>)delegate;

@end
