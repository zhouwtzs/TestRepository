//
//  VideoThumbBar.m
//  AppleVideoEditDemo
//
//  Created by 周文涛 on 16/7/13.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import "VideoThumbBar.h"

@implementation VideoThumbBar

{
    CGPoint _beginPoint;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor blackColor];
        
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(-10, 0, 25, frame.size.height)];
        
        _lineView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        
        _lineView.backgroundColor = [UIColor clearColor];
        
        UIView * line = [[UIView alloc]initWithFrame:CGRectMake(10, 0, 5, frame.size.height)];
        
        line.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        
        line.backgroundColor = [UIColor whiteColor];
        
        line.layer.cornerRadius = 2.5f;
        
        [_lineView addSubview:line];
        
        [self addSubview:_lineView];
        
        _pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(lineViewPan:)];
        
        [_lineView addGestureRecognizer:_pan];
        
        _longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(viewLongPress:)];
        
        _longPress.numberOfTapsRequired = 1;
        
        _longPress.numberOfTouchesRequired = 1;
        
        [self addGestureRecognizer:_longPress];
    }
    return self;
}

#pragma mark - 手势

- (void)lineViewPan:(UIPanGestureRecognizer *)pan{
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        
        _beginPoint = _lineView.center;
        
    }else if (pan.state == UIGestureRecognizerStateChanged){
        
        CGPoint offectPoint = [pan translationInView:self];
        
        float point_x = MAX(5, MIN(self.bounds.size.width-5, _beginPoint.x+offectPoint.x));
        
        _lineView.center = CGPointMake(point_x, _beginPoint.y);
        
        if ([self.delegate respondsToSelector:@selector(VideoBottonLineScale:)]) {
            
            [self.delegate VideoBottonLineScale:(point_x/self.bounds.size.width)];
        }
    }else if (pan.state == UIGestureRecognizerStateEnded){
        
        
    }
}

- (void)viewLongPress:(UILongPressGestureRecognizer *)longPress{
    //展开详细的视图
    
}

@end
