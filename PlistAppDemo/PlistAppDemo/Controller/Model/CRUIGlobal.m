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
    
    return @[[UIImage imageNamed:@"tabbar_wx_gray"],
             [UIImage imageNamed:@"tabbar_txl_gray"],
             [UIImage imageNamed:@"tabbar_fx_gray"],
             [UIImage imageNamed:@"tabbar_me_gray"]];
}


+ (void)setStartImage:(UIImage *)startImage
{
    
    NSString * str1 = @"http://h.hiphotos.baidu.com/image/pic/item/3bf33a87e950352a89201e015143fbf2b2118b71.jpg";
    
    NSString * str2 = @"http://c.hiphotos.baidu.com/image/pic/item/caef76094b36acaffc4501f57ed98d1001e99c16.jpg";
    
    NSString * str3 = @"http://d.hiphotos.baidu.com/image/pic/item/64380cd7912397ddfa38a30d5b82b2b7d0a28771.jpg";
    
    NSString * str4 = @"http://c.hiphotos.baidu.com/image/pic/item/6d81800a19d8bc3e73f7dac3808ba61ea8d34538.jpg";
    
    NSArray * imageStrArr = @[str1,str2,str3,str4];
/*=================以上是测试=================*/
    
    NSString * appDir = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString * filePath = [NSString stringWithFormat:@"%@/startImage.jpg",appDir];
    
    NSFileManager * fileManager = [NSFileManager defaultManager];
    
    NSURL * urlString = [NSURL URLWithString:imageStrArr[arc4random()%4]];
    
    NSData * imageData = [NSData dataWithContentsOfURL:urlString];
    
    BOOL success =[fileManager createFileAtPath:filePath contents:imageData attributes:nil];
    
    NSLog(@"%@",filePath);
    
    NSLog(@"%d",success);
    
    //http://h.hiphotos.baidu.com/image/pic/item/3bf33a87e950352a89201e015143fbf2b2118b71.jpg
    //http://c.hiphotos.baidu.com/image/pic/item/caef76094b36acaffc4501f57ed98d1001e99c16.jpg
    //http://d.hiphotos.baidu.com/image/pic/item/64380cd7912397ddfa38a30d5b82b2b7d0a28771.jpg
    //http://c.hiphotos.baidu.com/image/pic/item/6d81800a19d8bc3e73f7dac3808ba61ea8d34538.jpg
}

+ (UIImage *)getStartImage
{
    NSString * appDir = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString * filePath = [NSString stringWithFormat:@"%@/startImage.jpg",appDir];
    
    UIImage * startImage = [UIImage imageWithContentsOfFile:filePath];
    
    if (!startImage) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"startImage" ofType:@"jpg"];
        
        startImage = [UIImage imageWithContentsOfFile:path];
    }
    return startImage;
}

+ (void)setRootTabbarButtonTitle:(NSArray *)title
{
    USERDEFAUSE;
    
    [defaults setObject:title forKey:@"rootTabbarButtonTitle"];
}

+ (NSArray *)getRootTabbarButtonTitle
{
    USERDEFAUSE;
    
    if ([defaults objectForKey:@"rootTabbarButtonTitle"]) {
    
        return (NSArray *)[defaults objectForKey:@"rootTabbarButtonTitle"];
    }

    return @[NSLOCALSTR(@"CRWX", ),NSLOCALSTR(@"CRTXL", ),
             NSLOCALSTR(@"CRFX", ),NSLOCALSTR(@"CRME", )];
}

+ (BOOL)firstRunning
{
    USERDEFAUSE;
    
    if ([defaults objectForKey:@"appFirstRunning"]) {
        
        return NO;
    }
    [defaults setObject:@NO forKey:@"appFirstRunning"];
    
    return YES;
}

@end
