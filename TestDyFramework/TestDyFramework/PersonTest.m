//
//  PersonTest.m
//  TestDyFramework
//
//  Created by 周文涛 on 16/2/25.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import "PersonTest.h"
#import <UIKit/UIKit.h>

@implementation PersonTest

- (void)run
{
    NSLog(@"running");
    
    for (int i = 0; i<9; i++) {
        
        for (int j = 0; j < 9; j++) {
            
            if (j < 5-i  || j > 5+i) {
                
                printf(" ");
            }else {
            
                printf("*");
            }
        }
        printf("\n");
    }
}

@end
