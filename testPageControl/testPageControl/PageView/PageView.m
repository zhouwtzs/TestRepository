//
//  PageView.m
//  testPageControl
//
//  Created by 周文涛 on 16/2/29.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import "PageView.h"

#define PI  3.1415926535

#define WEAKSELF typeof(self) __weak weakSelf = self;

//创建一个圆形的view
@implementation UIView (createArc)

- (id)initWithArcCenter:(CGPoint)position radius:(CGFloat)radius;
{
    self = [self init];
    
    if (self) {
        
        self.bounds = CGRectMake(0, 0, radius*2, radius*2);
        
        self.center = position;
        
        self.layer.cornerRadius = radius;
    }
    return self;
}
@end

//自定义动画
@implementation CAShapeLayer (animation)

+ (void)animateWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations
{
    [CATransaction begin];
    //显式事务默认开启动画效果,kCFBooleanTrue关闭
    [CATransaction setValue:(id)kCFBooleanFalse forKey:kCATransactionDisableActions];
    //动画执行时间
    [CATransaction setValue:[NSNumber numberWithFloat:5.0f] forKey:kCATransactionAnimationDuration];
    //[CATransaction setAnimationDuration:[NSNumber numberWithFloat:5.0f]];
    animations();
    
    [CATransaction commit];
}

@end



@implementation PageView

{
    NSMutableArray * _minorViewArr;
    
    CGFloat _leftOffset;
    
    CGFloat _interval;
    
    CGFloat _hh;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _hh = self.layer.cornerRadius = frame.size.height/2;
        
        _leftOffset = _hh + 3;
        
        self.backgroundColor = [UIColor colorWithRed:91/255.0 green:48/255.0 blue:86/255.0 alpha:1.0f];
        
        //_mainBackLayer = [[PointLayer alloc]initWithArcCenter:CGPointMake(_hh+3, _hh) radius:_hh+3];
        
        //_mainBackLayer.fillColor = self.backgroundColor.CGColor;
        
        _mainView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        
        _mainView.bounds = CGRectMake(0, 0, 2*_hh-3, 2*_hh-3);
        
        _mainView.layer.cornerRadius = _mainView.bounds.size.width/2;
        
        _mainView.center = CGPointMake(_hh+3, _hh);
        
        _mainView.backgroundColor = [UIColor redColor];
        
        [self addSubview:_mainView];
        
        //_mainLayer = [[PointLayer alloc]initWithArcCenter:CGPointMake(_hh+3, _hh) radius:_hh-1];
        
        //_mainLayer.fillColor = [UIColor redColor].CGColor;
        
        //_minorView = [[PageMinorView alloc]initWithArcCenter:CGPointMake(2*_hh+3, _hh) radius:_hh-3];
        
        _minorViewArr = [[NSMutableArray alloc]init];
        
        _currentPage = 0;
        
    }
    return self;
}

- (void)setNumberOfPages:(NSInteger)numberOfPages
{
    _numberOfPages = numberOfPages;
    
    [self createUI];
}

- (void)createUI
{
    if (![self.subviews containsObject:_mainView]) {
        
        [self addSubview:_mainView];
    }
    //if (![self.layer.sublayers containsObject:_mainBackLayer]) {
        
      //  [self.layer insertSublayer:_mainBackLayer below:_mainLayer];
    //}
    
    _interval = (self.frame.size.width - 2* _leftOffset)/(_numberOfPages-1);
    
    for (NSInteger i = 1; i < _numberOfPages; i++) {
        
        PageMinorView  * minorView = [[PageMinorView alloc]initWithArcCenter:CGPointMake(i*_interval+_leftOffset, _hh) radius:_hh-10];
        
        minorView.tag = 800+i;
        
        minorView.moveRadius = _interval/2;
        
        [minorView addTarget:self action:@selector(chickOnView:) forControlEvents:UIControlEventTouchUpInside];

        [_minorViewArr addObject:minorView];
        
        [self insertSubview:minorView belowSubview:_mainView];
    }
}

- (void)chickOnView:(PageMinorView *)minor
{
    float index = minor.tag-800;
    
    NSLog(@"%ld",(long)index);
    
    if (index-1 < _currentPage) {
        //点击的小圆点在大圆点的左边
        for (NSInteger i = index-1; i < _currentPage; i++) {
            
            PageMinorView  * minorView = _minorViewArr[i];
            
            [minorView moveRight];
        }
        _currentPage = index-1;
        
        [UIView animateWithDuration:0.5 animations:^{
            
            _mainView.layer.position = CGPointMake(_currentPage*_interval+_leftOffset, _hh);
            
            //_mainBackLayer.position = CGPointMake(_currentPage*_interval+_leftOffset, _hh);
            
        }];
        
        [UIView animateWithDuration:0.25 animations:^{
            
            _mainView.transform = CGAffineTransformMakeScale(0.5, 0.5);
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.25 animations:^{
                
                _mainView.transform = CGAffineTransformIdentity;
            }];
        }];
        
    }else{
        //点击的小圆点在大圆点的右边
        
        for (NSInteger i = _currentPage; i < index; i++) {
            
            PageMinorView  * minorView = _minorViewArr[i];
            
            [minorView moveLeft];
        }
        _currentPage = index;

        [UIView animateWithDuration:0.25 animations:^{
            
            _mainView.layer.position = CGPointMake(_currentPage*_interval+_leftOffset, _hh);
            
            //_mainBackLayer.position = CGPointMake(_currentPage*_interval+_leftOffset, _hh);
            
        }];
        
        [UIView animateWithDuration:0.25 animations:^{
            
            _mainView.transform = CGAffineTransformMakeScale(0.5, 0.5);
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.25 animations:^{
                
                _mainView.transform = CGAffineTransformIdentity;
            }];
        }];
    }
}

@end


#pragma mark - PointLayer
/*===================================*/
@implementation PointLayer

- (id)initWithArcCenter:(CGPoint)position radius:(CGFloat)radius
{
    self = [super init];
    
    if (self) {
    
        self.radius = radius;
        
        self.bounds = CGRectMake(0, 0, radius*2, radius*2);
        
        self.position = position;
        
        self.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius) radius:radius startAngle:0 endAngle:2*PI clockwise:YES].CGPath;
        
        self.fillColor = [UIColor colorWithRed:91/255.0 green:48/255.0 blue:86/255.0 alpha:1.0f].CGColor;
        
        self.strokeColor = self.fillColor;
    }
    return self;
}

@end



#pragma mark - PageMinorView
/*================================*/
@implementation PageMinorView

{
    UIBezierPath * leftBezierPath;
 
    UIBezierPath * RightBezierPath;
    
    UIBezierPath * shakePath;
}



- (id)initWithArcCenter:(CGPoint)position radius:(CGFloat)radius;
{
    self = [super init];
    
    if (self) {
        
        self.bounds = CGRectMake(0, 0, radius*2, radius*2);
        
        self.center = position;
        
        self.contentLayer = [[PointLayer alloc]initWithArcCenter:CGPointMake(radius, radius) radius:radius];
        
        self.contentLayer.strokeColor = self.contentLayer.fillColor = [UIColor orangeColor].CGColor;
        
        [self.layer addSublayer:self.contentLayer];
        
        //[self createTransforms];
    }
    return self;
}

#pragma mark - createBezier
- (UIBezierPath *)createLeftBezierPathIfNeed
{
    if (leftBezierPath) {
        
        return leftBezierPath;
    }
    leftBezierPath = [[UIBezierPath alloc]init];
    
    [leftBezierPath addArcWithCenter:CGPointMake(self.center.x - _moveRadius, self.center.y) radius:_moveRadius startAngle:0 endAngle:PI clockwise:YES];
    
    return leftBezierPath;
}

- (UIBezierPath *)createRightBezierPathIfNeed
{
    if (RightBezierPath) {
        
        return RightBezierPath;
    }
    RightBezierPath = [[UIBezierPath alloc]init];
    
    [RightBezierPath addArcWithCenter:CGPointMake(self.center.x + _moveRadius, self.center.y) radius:_moveRadius startAngle:PI endAngle:2*PI clockwise:NO];
    
    return RightBezierPath;
}

#pragma mark - fun
- (CGPoint)pointToOvalCenter:(CGPoint)center radius:(CGFloat)rad angle:(CGFloat)ang;
{
    CGFloat x;
    CGFloat y;
    
    x = cos(ang)*rad;
    y = sin(ang)*rad;
    
    return CGPointMake(center.x + x, center.y + y);
}

- (CGAffineTransform)transformWithAngle:(CGFloat)ang
{
    float aa = fabs(ang-0.5);
        
    CGAffineTransform t1 = CGAffineTransformMakeScale(0.5+aa, 1.0f);
    
    CGAffineTransform t2 = CGAffineTransformMakeRotation(ang*PI);
    
    return CGAffineTransformConcat(t1, t2);
}


#pragma mark - UI动画


//向左移动
- (void)moveLeft
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    
    animation.keyPath = @"position";
    
    animation.duration = 0.5;
    
    animation.path = [self createLeftBezierPathIfNeed].CGPath;
    
    animation.rotationMode = kCAAnimationRotateAuto;
    
    [self.contentLayer addAnimation:animation forKey:nil];
    
    self.center = CGPointMake(self.center.x - _moveRadius*2, self.center.y);
    
//    WEAKSELF
//    [UIView animateWithDuration:0.25 animations:^{
//        
//        weakSelf.contentLayer.affineTransform = CGAffineTransformMakeScale(0.5, 1);
//        
//        weakSelf.transform = CGAffineTransformMakeRotation(PI*0.5);
//    } completion:^(BOOL finished) {
//        
//        [UIView animateWithDuration:0.25 animations:^{
//            
//            weakSelf.contentLayer.affineTransform = CGAffineTransformMakeScale(1, 1);
//            
//            weakSelf.transform = CGAffineTransformMakeRotation(PI);
//            
//        }completion:^(BOOL finished) {
//            
//            weakSelf.contentLayer.affineTransform = CGAffineTransformIdentity;
//            
//            weakSelf.transform = CGAffineTransformIdentity;
//            
//            [weakSelf moveShake];
//        }];
//        
//    }];
}

//向右移动
- (void)moveRight
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    
    animation.keyPath = @"position";
    
    animation.duration = 2;
    
    animation.path = [self createRightBezierPathIfNeed].CGPath;
    
    animation.rotationMode = kCAAnimationRotateAuto;
    
    [self.contentLayer addAnimation:animation forKey:nil];
    
    self.center = CGPointMake(self.center.x + _moveRadius*2, self.center.y);

//    WEAKSELF
//    [UIView animateWithDuration:0.25 animations:^{
//        //形状
//        weakSelf.contentLayer.affineTransform = CGAffineTransformMakeScale(0.5, 1);
//        
//        weakSelf.transform = CGAffineTransformMakeRotation(-PI*0.5);
//        
//    } completion:^(BOOL finished) {
//        
//        [UIView animateWithDuration:0.25 animations:^{
//            
//            weakSelf.contentLayer.affineTransform = CGAffineTransformMakeScale(1, 1);
//            
//            weakSelf.transform = CGAffineTransformMakeRotation(-PI);
//            
//        }completion:^(BOOL finished) {
//            
//            weakSelf.contentLayer.affineTransform = CGAffineTransformIdentity;
//            
//            weakSelf.transform = CGAffineTransformIdentity;
//            
//            [weakSelf moveShake];
//        }];
//        
//    }];
}

//移动结束后抖动
- (void)moveShake
{
    shakePath = [[UIBezierPath alloc]init];
    
    [shakePath moveToPoint:CGPointMake(0, 0)];
    
    [shakePath addLineToPoint:CGPointMake(100, 0)];
    
    [shakePath addLineToPoint:CGPointMake(100, 200)];
    
}

@end



