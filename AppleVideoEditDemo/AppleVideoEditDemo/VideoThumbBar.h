//
//  VideoThumbBar.h
//  AppleVideoEditDemo
//
//  Created by 周文涛 on 16/7/13.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VideoEditBottomViewDelegate <NSObject>

- (void)VideoBottonLineScale:(float)scale;      //当前的lineview在view中的位置

@end

@interface VideoThumbBar : UIView

//子视图
@property (nonatomic, strong) NSMutableArray * abstractImages;      //摘要图片

@property (nonatomic, strong) NSMutableArray * detailImage;         //精细的图片

@property (nonatomic, strong) UIView * lineView;                    //小竖条
//代理
@property (nonatomic, weak) id<VideoEditBottomViewDelegate> delegate;//代理
//手势
@property (nonatomic, strong) UIPanGestureRecognizer * pan;         //拖动手势

@property (nonatomic, strong) UILongPressGestureRecognizer * longPress;//长按手势
@end
