//
//  CoolButton.h
//  0213Demo
//
//  Created by ZJCS on 17/2/17.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "BaseComponent.h"

@class CoolButton;
@protocol CoolButtonAnimationDelegate <NSObject>

- (void)coolButtonDidStart:(CoolButton *)button animation:(CAAnimation *)animation;
- (void)coolButtonDidStop:(CoolButton *)button animation:(CAAnimation *)animation;

@end

@interface CoolButton : BaseComponent

@property (nonatomic, strong)NSString			*text;

@property (nonatomic, strong)UIColor			*textColor;

@property (nonatomic, strong)UIFont				*font;

@property (nonatomic, strong)UIImage			*image;

@property (nonatomic, strong)UIColor			*maskTextColor;

@property (nonatomic, strong)UIColor			*bgColor;

@property (nonatomic, strong)UIImage			*backgroundImage;

/**
 遮罩/浮层需要显示的文本或图片
 */
@property (nonatomic, strong)id                  maskContent;


@property (nonatomic, strong)UIView             *backgroundView;

@property (nonatomic, strong)UILabel            *textLabel;

@property (nonatomic, strong)UIImageView        *imageView;

@property (nonatomic, strong)CALayer            *maskLayer;

@property (nonatomic, strong)CATextLayer        *maskTextLayer;


@property (nonatomic, weak)id<CoolButtonAnimationDelegate>  buttonAnimationDelegate;





- (void)setText:(NSString *)text forState:(UIControlState)state;

- (void)setTextColor:(UIColor *)textColor forState:(UIControlState)state;

- (void)setFont:(UIFont *)font forState:(UIControlState)state;

- (void)setImage:(UIImage *)image forState:(UIControlState)state;

- (void)setBgColor:(UIColor *)bgColor forState:(UIControlState)state;

- (void)setMaskTextColor:(UIColor *)maskTextColor forState:(UIControlState)state;

- (void)setBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state;


- (NSString *)textForState:(UIControlState)state;

- (UIColor *)textColorForState:(UIControlState)state;

- (UIFont *)fontForState:(UIControlState)state;

- (UIImage *)imageForState:(UIControlState)state;

- (UIImage *)backgroundImageForState:(UIControlState)state;

- (void)beginLoad;
- (void)endLoad;


@end
