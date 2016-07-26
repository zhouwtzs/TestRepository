//
//  VideoDownload.m
//  AppleVideoEditDemo
//
//  Created by 周文涛 on 16/7/5.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import "VideoDownload.h"

@implementation VideoDownload

+ (void)saveVideo{

    NSString * path1 = @"/Users/zhouwentao/Desktop/viewVideo1.mp4";
    
    NSString * path2 = @"/Users/zhouwentao/Desktop/viewVideo15.mp4";
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *path = [paths objectAtIndex:0];
    
    //NSLog(@"%@",path);
    
    NSData * video1Data = [NSData dataWithContentsOfFile:path1];
    
    NSData * video15Data = [NSData dataWithContentsOfFile:path2];
    
    NSFileManager * manager = [NSFileManager defaultManager];
    
    [manager createFileAtPath:[path stringByAppendingString:@"/video1.mp4"] contents:video1Data attributes:nil];
    
    [manager createFileAtPath:[path2 stringByAppendingString:@"/video15.mp4"] contents:video15Data attributes:nil];
}

@end
