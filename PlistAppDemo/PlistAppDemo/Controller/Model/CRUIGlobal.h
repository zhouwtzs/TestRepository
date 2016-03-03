//
//  CRGlobal.h
//  PlistAppDemo
//
//  Created by 周文涛 on 16/2/25.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CRUIGlobal : NSObject

+ (void)setRootTabbarButtonIcon:(NSArray *)icons;

+ (NSArray *)getRootTabbarButtonIcon;

+ (void)setStartImage:(UIImage *)startImage;

+ (UIImage *)getStartImage;

+ (void)setRootTabbarButtonTitle:(NSArray *)title;

+ (NSArray *)getRootTabbarButtonTitle;

+ (BOOL)firstRunning;

@end
