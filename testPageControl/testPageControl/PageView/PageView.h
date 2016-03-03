//
//  PageView.h
//  testPageControl
//
//  Created by 周文涛 on 16/2/29.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PointLayer,pageMain,PageMinorView,PageView;

@protocol PageViewDelegate <NSObject>

- (BOOL)pageView:(PageView *)view SelecetedAtIndex:(NSInteger)index;

@end

@interface PageView : UIView

@property(nonatomic,strong)UIView * mainView;

@property(nonatomic,strong)UIView * mainBackView;

@property(nonatomic,strong)PageMinorView * minorView;

@property(nonatomic) NSInteger numberOfPages;

@property(nonatomic) NSInteger currentPage;

@end

/*  中间的view */
@interface PagemainView : UIView

@property(nonatomic,strong)UIView * contentView;

@end

//一个点
@interface PointLayer : CAShapeLayer

@property (nonatomic,assign)CGFloat radius;             //半径

- (id)initWithArcCenter:(CGPoint)position radius:(CGFloat)radius;
@end




/* 小点 */
@interface PageMinorView : UIControl

@property(nonatomic,strong)PointLayer * contentLayer;

@property(nonatomic,assign)CGFloat moveRadius;          //移动轨迹的半径

@property(nonatomic,assign)BOOL isMoving;               //是否正在移动

- (id)initWithArcCenter:(CGPoint)position radius:(CGFloat)radius;

- (void)moveLeft;

- (void)moveRight;

@end


/*  创建圆形view*/
@interface UIView (createArc)

- (id)initWithArcCenter:(CGPoint)position radius:(CGFloat)radius;

@end

@interface CALayer (animation)

+ (void)animateWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations;

@end
