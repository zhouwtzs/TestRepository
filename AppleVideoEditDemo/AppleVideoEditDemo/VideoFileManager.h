//
//  VideoFileManager.h
//  AppleVideoEditDemo
//
//  Created by 周文涛 on 16/7/1.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>

/*
 数据源的控制
 */
@interface VideoFileManager : NSObject

+ (NSArray *)videoType;

+ (NSString *)videoURL:(NSInteger)videoTime;

+ (NSString *)videoPath:(NSInteger)videoTIme send:(BOOL)isSend;

@end


/*
 视频缓存本地
 */
@interface VideoCacheManager : NSObject

+ (void)VideoLocalCahceWithAsset:(AVAsset *)asset fileName:(NSString *)name;

@end