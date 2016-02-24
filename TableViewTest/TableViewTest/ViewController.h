//
//  ViewController.h
//  TableViewTest
//
//  Created by 周文涛 on 16/2/24.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestTabelViewDelegate.h"
#import "TableViewController.h"

@interface ViewController : UIViewController<TestTabelViewDelegate>

@property(nonatomic,strong)TableViewController * tableVC;

@property(nonatomic,strong)NSMutableArray * dataSource;

@end

