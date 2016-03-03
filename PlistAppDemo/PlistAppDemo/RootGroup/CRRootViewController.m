//
//  CRRootViewController.m
//  PlistAppDemo
//
//  Created by 周文涛 on 16/2/25.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import "CRRootViewController.h"

@interface CRRootViewController ()

@end

@implementation CRRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)createSubViewControllers
{
    NSArray * VCStringArr = @[@"CRWCViewController",
                              @"CRTXLViewController",
                              @"CRFXViewController",
                              @"CRMEViewController"];
    
    NSArray * tabbarButtonNames = @[NSLOCALSTR(@"CRWX", ),NSLOCALSTR(@"CRTXL", ),
                                    NSLOCALSTR(@"CRFX", ),NSLOCALSTR(@"CRME", )];
    
    
    [VCStringArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        Class viewController = [NSClassFromString(obj) class];
        
        UINavigationController * navigatioVC = (UINavigationController *)[[viewController alloc]init];
        
        navigatioVC.tabBarItem.title = tabbarButtonNames[idx];
        
        [self addChildViewController:navigatioVC];
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
