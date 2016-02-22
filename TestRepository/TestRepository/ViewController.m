//
//  ViewController.m
//  TestRepository
//
//  Created by 周文涛 on 16/2/22.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:view];
    
    
    UIView * view2 = [[UIView alloc]initWithFrame:CGRectMake(200, 200, 100, 100)];
    
    view2.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:view2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
