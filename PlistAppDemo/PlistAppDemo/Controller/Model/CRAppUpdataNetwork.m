//
//  CRAppUpdataNetwork.m
//  PlistAppDemo
//
//  Created by 周文涛 on 16/2/26.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import "CRAppUpdataNetwork.h"

@implementation CRAppUpdataNetwork

+ (BOOL)decetingAppLatestEdition
{
    //版本号：
    [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    
    return YES;
}

@end
