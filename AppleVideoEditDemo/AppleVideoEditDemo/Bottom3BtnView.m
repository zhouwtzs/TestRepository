//
//  Bottom3BtnView.m
//  AppleVideoEditDemo
//
//  Created by 周文涛 on 16/7/11.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import "Bottom3BtnView.h"

#define VIEW_H 44

@implementation Bottom3BtnView

- (instancetype)initWithImage:(NSArray<UIImage *> *)images{
    
    if (images.count != 3) {
        
        return nil;
    }
    
    self = [self initWithFrame:CGRectMake(0, SCREEN_H - VIEW_H, SCREEN_W, VIEW_H)];
    
    if (self) {
        
        [_leftBtn setImage:images[0] forState:UIControlStateNormal];
        
        [_centerBtn setImage:images[1] forState:UIControlStateNormal];
        
        [_rightBtn setImage:images[2] forState:UIControlStateNormal];
    }
    return self;
}

- (instancetype)initWithTitle:(NSArray<NSString *> *)titles{
    
    if (titles.count != 3) {
        
        return nil;
    }
    
    self = [self initWithFrame:CGRectMake(0, SCREEN_H - VIEW_H, SCREEN_W, VIEW_H)];
    
    if (self) {
        
        [_leftBtn setTitle:titles[0] forState:UIControlStateNormal];
        
        [_centerBtn setTitle:titles[1] forState:UIControlStateNormal];
        
        [_rightBtn setTitle:titles[2] forState:UIControlStateNormal];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
        
        float ff = frame.size.width/3;
        
        float ffh = frame.size.height;
        
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _leftBtn.frame = CGRectMake(0, 0, ff, ffh);
        
        _leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, _leftBtn.bounds.size.width-VIEW_H);
        
        _leftBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
        
        [self addSubview:_leftBtn];
        
        _centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _centerBtn.frame = CGRectMake(ff, 0, ff, ffh);
        
        _centerBtn.imageEdgeInsets = UIEdgeInsetsMake(0, (ff-VIEW_H)/2, 0, (ff-VIEW_H)/2);
        
        _centerBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_centerBtn];
        
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _rightBtn.frame = CGRectMake(2*ff, 0, ff, ffh);
        
        _rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, _rightBtn.bounds.size.width-VIEW_H, 0, 0);

        _rightBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        
        [self addSubview:_rightBtn];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
