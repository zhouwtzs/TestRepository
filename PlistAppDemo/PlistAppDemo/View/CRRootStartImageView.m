//
//  CRRootStartImageView.m
//  PlistAppDemo
//
//  Created by 周文涛 on 16/2/25.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import "CRRootStartImageView.h"
#import "CRUIGlobal.h"

@implementation CRRootStartImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)init
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    
    if (self) {
        
        self.image = [CRUIGlobal getStartImage];
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapOnImage:)];
        
        [self addGestureRecognizer:tap];
        
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)showStartImage
{
    UIWindow * window = [UIApplication sharedApplication].windows.firstObject;
    
    [window addSubview:self];
    
    [self performSelector:@selector(hidStartImage) withObject:nil afterDelay:2];
}

- (void)hidStartImage
{
    [CRUIGlobal setStartImage:nil];
    WEAKSELF;
    [UIView animateWithDuration:0.3 animations:^{
        
        weakSelf.alpha = 0.01;
        
    } completion:^(BOOL finished) {
        
        [weakSelf removeFromSuperview];

    }];
}

- (void)tapOnImage:(UITapGestureRecognizer *)tap
{
    //NSLog(@"跳转广告");
    
    NSURL * AppUrl = [NSURL URLWithString:@"itms-apps://itunes.apple.com/cn"];
    
    [[UIApplication sharedApplication] openURL:AppUrl];
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
}

@end
