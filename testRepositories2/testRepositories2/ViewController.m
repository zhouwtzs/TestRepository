//
//  ViewController.m
//  testRepositories2
//
//  Created by 周文涛 on 16/2/23.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button1.frame = CGRectMake(100, 100, 100, 100);
    
    [self.view addSubview:button1];
    
    [button1 addTarget:self action:@selector(pressButton1:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)pressButton1:(UIButton *)button
{
    NSLog(@"hahaha");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
