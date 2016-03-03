//
//  main.m
//  base64Test
//
//  Created by 周文涛 on 16/3/3.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, const char * argv[]) {
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    return NSApplicationMain(argc, argv);
}
