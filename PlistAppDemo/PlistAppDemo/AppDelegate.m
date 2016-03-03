//
//  AppDelegate.m
//  PlistAppDemo
//
//  Created by 周文涛 on 16/2/25.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import "AppDelegate.h"
#import "CRRootStartImageView.h"
#import "CRRootViewController.h"
#import "CRAppUpdataNetwork.h"
#import "CRUIGlobal.h"

@interface AppDelegate ()

//@property (nonatomic,strong)CRRootStartImageView * startImageView;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    UIWindow * window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    window.backgroundColor = [UIColor whiteColor];
    
    CRRootViewController * rootVC = [[CRRootViewController alloc]init];
    
    [rootVC createSubViewControllers];
    
    window.rootViewController = rootVC;
    
    self.window = window;
    
    [self.window makeKeyAndVisible];
    
    /*====================do other===================*/
    //1.检测是否第一次运行
    if ([CRUIGlobal firstRunning]) {
        
        NSLog(@"第一次运行");
    }
    //2.启动startImage
    CRRootStartImageView * startimage = [[CRRootStartImageView alloc]init];
    
    [startimage showStartImage];
    //3.检测版本更新
    if ([CRAppUpdataNetwork decetingAppLatestEdition]) {
        
        NSLog(@"有新版本更新啦!");
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
