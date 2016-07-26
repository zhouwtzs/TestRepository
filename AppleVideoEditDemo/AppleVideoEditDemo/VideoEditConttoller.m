//
//  VideoEditConttoller.m
//  AppleVideoEditDemo
//
//  Created by 周文涛 on 16/7/5.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import "VideoEditConttoller.h"
#import "VideoThumbBar.h"

@interface VideoEditConttoller ()

@property (nonatomic, strong) VideoThumbBar * thumbBar;

@property (nonatomic, strong) UIImageView * gibImageView;

@end

@implementation VideoEditConttoller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    
    [self createUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark _ createUI
- (void)createUI{
    
    _gibImageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    _thumbBar = [[VideoThumbBar alloc]init];

}







@end
