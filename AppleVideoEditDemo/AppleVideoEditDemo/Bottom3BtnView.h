//
//  Bottom3BtnView.h
//  AppleVideoEditDemo
//
//  Created by 周文涛 on 16/7/11.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Bottom3BtnView : UIView

@property (nonatomic, strong)UIButton * leftBtn;

@property (nonatomic, strong)UIButton * centerBtn;

@property (nonatomic, strong)UIButton * rightBtn;

- (instancetype)initWithImage:(NSArray <UIImage *>*)images;

- (instancetype)initWithTitle:(NSArray <NSString *> *)titles;

@end
