//
//  BaseComponent.h
//  0213Demo
//
//  Created by ZJCS on 17/2/17.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataPool.h"
#import "PointButton.h"

typedef enum : NSUInteger {
    ButtonEffectTypeNone = 0,
	ButtonEffectTypeScale, // 伸缩
    ButtonEffectTypeHeartBeat0, // 心跳
    ButtonEffectTypeHeartBeat1, // 心跳
	ButtonEffectTypeRise, // 升起
	ButtonEffectTypeLoad, // 加载
	ButtonEffectTypeLoad1, // 加载(文字)
    ButtonEffectTypeProgress, // 进度
    ButtonEffectTypeThrow, // 抛物线
	ButtonEffectTypeRipple, // 波纹
	ButtonEffectTypeMark, // mark
} ButtonEffectType;

@class BaseComponent;
@protocol BaseControlDelegate <NSObject>

@optional
- (void)viewEventBecomeActived:(BaseComponent *)view;
- (void)viewEventIsActiving:(BaseComponent *)view;
@end


@interface BaseComponent : UIView

/**
 代理
 */
@property (nonatomic, weak)id<BaseControlDelegate>	delegate;



/**
 目标对象
 */
@property (nonatomic, weak)id					target;


/**
 事件
 */
@property (nonatomic)SEL						selector;


/**
 *  是否有效
 */
@property (nonatomic, assign) BOOL				enabled;


/**
 *  是否选中
 */
@property (nonatomic, assign) BOOL				selected;


/**
 按钮状态
 */
@property (nonatomic, assign)UIControlState     controlState;


/**
 缩放比例，默认是0.95
 */
@property (nonatomic, assign)CGFloat			scale; // scale>0


/**
 放大倍数
 */
@property (nonatomic, assign)CGFloat            multipleScale; // scale>1

/**
 文本和图标的间距
 */
@property (nonatomic, assign)CGFloat            spacing;


/**
 动画执行时间
 */
@property (nonatomic, assign)CFTimeInterval		 duration;


/**
 按钮特效类别
 */
@property (nonatomic, assign)ButtonEffectType	 effectType;


/**
 按钮
 */
@property (nonatomic, strong)PointButton 			*button;


/**
 容器view，用于子类添加控件
 */
@property (nonatomic, strong, readonly)UIView	*containerView;


/**
 数据池,包括在text,textColor,font,image,backgroundColor等在noramel和selected两种状态下的数据
 */
@property (nonatomic, strong)DataPool       *dataPool;






- (instancetype)initWithFrame:(CGRect)frame buttonEffectType:(ButtonEffectType)effectType;


#pragma mark - overwrite for subView


- (void)addClickEvent;


/**
 ButtonEffectTypeNone
 */
- (void)btnNone;

/**
 ButtonEffectTypeScale
 */
- (void)btnScaleToSmall;
- (void)btnScaleToDefault;


/**
 ButtonEffectTypeHeartBeat0
 */
- (void)btnHeartBeat0TouchDown;
- (void)btnHeartBeat0TouchUpInside;


/**
 ButtonEffectTypeHeartBeat1
 */
- (void)btnHeartBeat1TouchDown;
- (void)btnHeartBeat1TouchUpInside;


/**
 ButtonEffectTypeRise
 */
- (void)btnImageRiseTouchUpInside;


/**
 ButtonEffectTypeLoad
 */
- (void)btnStartLoadTouchUpInside;



/**
 ButtonEffectTypeLoad1
 */
- (void)btnStartLoad1TouchUpInside;


/**
 ButtonEffectTypeProgress
 */
- (void)btnProgressTouchUpInside;



/**
 ButtonEffectTypeThrow
 */
- (void)btnThrowTouchUpInside;


/**
 ButtonEffectTypeRipple
 */
- (void)btnDisplayRippleTouchUpInside;


/**
 ButtonEffectTypeMark
 */
- (void)btnDisplayMarkTouchUpInside;





/**
 给视图赋值
 @param state 按钮的状态
 */
- (void)dataDisplay:(UIControlState)state;

@end
