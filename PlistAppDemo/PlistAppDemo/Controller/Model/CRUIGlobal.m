//
//  CRGlobal.m
//  PlistAppDemo
//
//  Created by 周文涛 on 16/2/25.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import "CRUIGlobal.h"


#define USERDEFAUSE  NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults]


@implementation CRUIGlobal

+ (void)setRootTabbarButtonIcon:(NSArray *)icons
{
    USERDEFAUSE;
    
    [defaults setObject:icons forKey:@"rootTabbarButtonIcon"];
}

+ (NSArray *)getRootTabbarButtonIcon
{
    USERDEFAUSE;
    
    if ([defaults objectForKey:@"rootTabbarButtonIcon"]) {
        
        return (NSArray *)[defaults objectForKey:@"rootTabbarButtonIcon"];
    }
    
    return nil;
}


+ (void)setStartImage:(UIImage *)startImage
{
    
}

+ (UIImage *)getStartImage
{
    return nil;
}

@end
