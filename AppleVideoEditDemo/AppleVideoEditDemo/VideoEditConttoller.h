//
//  VideoEditConttoller.h
//  AppleVideoEditDemo
//
//  Created by 周文涛 on 16/7/5.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface VideoEditConttoller : UIViewController

@property (nonatomic, strong) AVAsset * avAsset;

@property (nonatomic, strong) AVPlayerLayer * avplayerLayer;

@property (nonatomic, strong) AVPlayer * player;

@property (nonatomic, strong) AVPlayerItem * playerItem;

@end
