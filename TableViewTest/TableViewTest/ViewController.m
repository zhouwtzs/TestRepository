//
//  ViewController.m
//  TableViewTest
//
//  Created by 周文涛 on 16/2/24.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    /*
     * 这里要先创建数据源，因为tableVC在初始化的时候需要用到数据源
     */
    [self createData];
    
    [self createUI];
}

- (void)createData
{
    _dataSource = [[NSMutableArray alloc]init];
    
    for (NSInteger i = 0; i < 20; i++) {
        
        NSString * string = [NSString stringWithFormat:@"第%ld行",(long)i];
        
        [_dataSource addObject:string];
        
    }
}

- (void)createUI
{
    _tableVC = [[TableViewController alloc]initWithDelegate:self];
    
    _tableVC.delegate = self;
    
    _tableVC.tableView.frame = self.view.frame;
    
    [self.view addSubview:_tableVC.tableView];
}

#pragma mark - taleViewDelegate
- (void)tableViewDidSelectedCellAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击第%ld行",indexPath.row);
    
    //其他事件
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
