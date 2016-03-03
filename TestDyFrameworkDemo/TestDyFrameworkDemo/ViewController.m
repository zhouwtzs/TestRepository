//
//  ViewController.m
//  TestDyFrameworkDemo
//
//  Created by 周文涛 on 16/2/25.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import "ViewController.h"
#import <TestDyFramework/TestDyFramework.h>
#import <TestDyFramework/PersonTest.h>
@interface ViewController ()

{
    NSString * _lidPath;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createUI];
    
    [self buildTestFramework];
}

- (void)createUI
{
    UIView * view = [[UIView alloc]init];
    
    view.frame = CGRectMake(100, 100, 100, 100);
    
    [self.view addSubview: view];
}

- (void)buildTestFramework
{
    NSString * documentsPath = [NSString stringWithFormat:@"%@/Documents/TestDyFramework.framework/PersonTest",NSHomeDirectory()];
    
    [self loadFramework:documentsPath];

    [self testFramework];
}

- (void)loadFramework:(NSString *)path
{
    NSError * error = nil;
    
    NSBundle * bundle = [NSBundle bundleWithPath:path];
    
    if ([bundle loadAndReturnError:&error]){
        NSLog(@"bundle load framework success");
    }else{
        NSLog(@"bundle load framework err:%@",error);
    }
}

- (void)testFramework
{
    Class personClass = NSClassFromString(@"PersonTest");
    
    if (personClass) {
        
        id object = [[personClass alloc]init];
        
        [(PersonTest *) object run];
    }
    
    PersonTest * person = [[PersonTest alloc]init];
    
    [person run];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
