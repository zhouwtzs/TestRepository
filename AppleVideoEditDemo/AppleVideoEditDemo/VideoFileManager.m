//
//  VideoFileManager.m
//  AppleVideoEditDemo
//
//  Created by 周文涛 on 16/7/1.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import "VideoFileManager.h"

#define Send_Directory [NSTemporaryDirectory() stringByAppendingString:@"/video/send"]

#define Receive_Directort [NSTemporaryDirectory() stringByAppendingString:@"/video/receive"]

@implementation VideoFileManager


+ (NSArray *)videoType{

    return @[@"1秒 本地",@"15秒 本地",@"15秒 网络 观看",@"15秒 缓存后观看"];
}

+ (NSString *)videoURL:(NSInteger)videoTime{

    if (videoTime == 1) {
        
        return @"https://shop.yshjie.com/statichtml/bjmovie01/site/public/viewVideo.php?sn=76LU3-JYLVS-MZYVD-P1RGA";
        
    }else if (videoTime == 15){
    
        return @"https://shop.yshjie.com/statichtml/bjmovie01/site/public/viewVideo.php?sn=JFT4Q-P3ES1-XO4CE-5DCW3";
        
    }else{
        
        return @"";
    }
}

+ (NSString *)videoPath:(NSInteger)videoTIme send:(BOOL)isSend{

    if (isSend) {
        
        if (videoTIme == 1) {
            
            return [Send_Directory stringByAppendingString:@"/video1.mp4"];
            
        }else if (videoTIme == 15){
            
            return [Send_Directory stringByAppendingString:@"/video15.mp4"];
        }
    }else{
    
        if (videoTIme == 15) {
            
            return [Receive_Directort stringByAppendingString:@"/video15.mp4"];
        }
    }
    return @"";
}

@end


@implementation VideoCacheManager

+ (void)VideoLocalCahceWithAsset:(AVAsset *)asset fileName:(NSString *)name{

    AVAssetExportSession * exportSession = [[AVAssetExportSession alloc]initWithAsset:asset presetName:AVAssetExportPreset640x480];
    
    NSString * outPath = [Receive_Directort stringByAppendingString:@"/video15.mp4"];

    exportSession.outputURL = [NSURL fileURLWithPath:outPath];
    
    exportSession.outputFileType = AVFileTypeMPEG4;
    
    [exportSession exportAsynchronouslyWithCompletionHandler:^{
        
        switch (exportSession.status) {
            case AVAssetExportSessionStatusCompleted:{
            
                NSLog(@"success");
            }
                break;
            case AVAssetExportSessionStatusFailed:{
            
                NSLog(@"file");
            }
                break;
            default:
                break;
        }
    }];

}


/*
 isEqualToString:(NSString *)kUTTypeMovie]) {
 DLog(@"转化为 MP4 ");
 NSURL * _urlMedia = info[UIImagePickerControllerMediaURL];
 AVURLAsset * asset = [[AVURLAsset alloc]initWithURL:_urlMedia options:nil];
 NSArray * array = [AVAssetExportSession exportPresetsCompatibleWithAsset:asset];
 
 if ([array containsObject:AVAssetExportPresetHighestQuality]) {
 
 AVAssetExportSession * exportSession = [[AVAssetExportSession alloc]initWithAsset:asset presetName:AVAssetExportPreset640x480];
 NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
 [formatter setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
 NSString * outPath =[NSTemporaryDirectory() stringByAppendingFormat:@"%@.mp4",[formatter stringFromDate:[NSDate date]]];
 
 //                设置存入沙盒的视频的名字
 NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
 [def setObject:[formatter stringFromDate:[NSDate date]] forKey:@"willsendVideoName"];
 
 
 exportSession.outputFileType = AVFileTypeMPEG4;
 exportSession.outputURL = [NSURL fileURLWithPath:outPath];
 [exportSession exportAsynchronouslyWithCompletionHandler:^{
 
 switch ([exportSession status]) {
 case AVAssetExportSessionStatusCompleted:
 {  _pickerVc = picker;
 DLog(@"SUCCESS!!!!")
 _photoUrl = exportSession.outputURL;
 _dic = info;
 dispatch_async(dispatch_get_main_queue(), ^{
 UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:NSLocalizedString(@"Sure To Send Video", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"Cancel", nil) destructiveButtonTitle:NSLocalizedString(@"Send", nil) otherButtonTitles:nil, nil];
 actionSheet.tag = 1;
 // UIWindow *keywindow = [[UIApplication sharedApplication] keyWindow];
 [actionSheet showInView:_pickerVc.view];
 });
 
 }
 break;
 case AVAssetExportSessionStatusFailed:
 DLog(@"FAILED!!!");
 break;
 default:
 break;
 }
 
 }];
 
 
 
 
 }
 
 
 }

 */
@end


