//
//  TestTabelViewDelegate.h
//  TableViewTest
//
//  Created by 周文涛 on 16/2/24.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TestTabelViewDelegate <NSObject>

@property(nonatomic)NSMutableArray * dataSource;

- (void)tableViewDidSelectedCellAtIndexPath:(NSIndexPath *)indexPath;

@end
