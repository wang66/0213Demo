//
//  BaseComponent.m
//  0213Demo
//
//  Created by ZJCS on 17/2/17.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "BaseComponent.h"
#import "UIButton+CoolAnimation.h"


@interface BaseComponent ()

@property (nonatomic, strong)UIView                     *containerView;



@end

@implementation BaseComponent

- (instancetype)initWithFrame:(CGRect)frame buttonEffectType:(ButtonEffectType)effectType
{
	if(self = [super initWithFrame:frame])
	{
        self.dataPool = [[DataPool alloc] init];
        self.selected = NO;
		self.scale = 0.95;
        self.multipleScale = 1;
        self.spacing = 3.f;
		self.duration = 0.4f;
//		self.effectType = effectType;
        _effectType = effectType;
        
        if(effectType == ButtonEffectTypeLoad){
            self.duration = 2.5f;
            self.scale = 0.1;
        }
		
        // backgroundView就是添加在containerView上的
		_containerView = [[UIView alloc] initWithFrame:self.bounds];
		_containerView.userInteractionEnabled = NO;
		[self addSubview:_containerView];
		
		_button = [[PointButton alloc] initWithFrame:self.bounds];
		[self addSubview:_button];
    
        [self addClickEvent];
	}
	
	return self;
}

- (void)createCustomLayers
{
    
}

- (void)addClickEvent
{
	switch (self.effectType)
	{
        case ButtonEffectTypeNone:
        {
            [_button removeAllActions];
            [_button addTarget:self action:@selector(btnNone) forControlEvents:UIControlEventTouchUpInside];
        }
            break;
            
		case ButtonEffectTypeScale:
		{
            [_button removeAllActions];
			[_button addTarget:self action:@selector(btnScaleToSmall) forControlEvents:UIControlEventTouchDown];
			[_button addTarget:self action:@selector(btnScaleToDefault) forControlEvents:UIControlEventTouchUpInside];
		}
			break;
        case ButtonEffectTypeHeartBeat0:
        {
//            [_button addTarget:self action:@selector(btnHeartBeat0TouchDown) forControlEvents:UIControlEventTouchDown];
            [_button removeAllActions];
            [_button addTarget:self action:@selector(btnHeartBeat0TouchUpInside) forControlEvents:UIControlEventTouchUpInside];
        }
            break;
            
        case ButtonEffectTypeHeartBeat1:
        {
//            [_button addTarget:self action:@selector(btnHeartBeat1TouchDown) forControlEvents:UIControlEventTouchDragInside];
            [_button removeAllActions];
            [_button addTarget:self action:@selector(btnHeartBeat1TouchUpInside) forControlEvents:UIControlEventTouchUpInside];
        }
            break;
            
		case ButtonEffectTypeRise:
		{
            [_button removeAllActions];
			[_button addTarget:self action:@selector(btnImageRiseTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
		}
			break;
			
		case ButtonEffectTypeLoad:
		{
            [_button removeAllActions];
			[_button addTarget:self action:@selector(btnStartLoadTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
		}
			break;
			
		case ButtonEffectTypeLoad1:
		{
			[_button removeAllActions];
			[_button addTarget:self action:@selector(btnStartLoad1TouchUpInside) forControlEvents:UIControlEventTouchUpInside];
		}
			break;
			
        case ButtonEffectTypeProgress:
        {
            [_button removeAllActions];
            [_button addTarget:self action:@selector(btnProgressTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
        }
            break;
            
        case ButtonEffectTypeThrow:
        {
            [_button removeAllActions];
            [_button addTarget:self action:@selector(btnThrowTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
        }
            break;
			
		case ButtonEffectTypeRipple:
		{
			[_button addTarget:self action:@selector(btnDisplayRippleTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
		}
			break;
			
		case ButtonEffectTypeMark:
		{
            [_button removeAllActions];
			[_button addTarget:self action:@selector(btnDisplayMarkTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
		}
			break;
			
		default:
			break;
	}
}

- (void)becomeActivedSelectorAndDelegateEvent
{
	if(self.target&&self.selector){
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
		[self.target performSelector:self.selector withObject:self];
	}
	
	if([self.delegate respondsToSelector:@selector(viewEventBecomeActived:)]){
		[self.delegate viewEventBecomeActived:self];
	}
}


#pragma mark - ButtonEffectTypeNone
- (void)btnNone
{
    [self becomeActivedSelectorAndDelegateEvent];
}

#pragma mark - ButtonEffectTypeScale
- (void)btnScaleToSmall
{
	[self becomeActivedSelectorAndDelegateEvent];
}

- (void)btnScaleToDefault
{
	
}


#pragma mark - ButtonEffectTypeHeartBeat0
- (void)btnHeartBeat0TouchDown
{
    [self becomeActivedSelectorAndDelegateEvent];
}

- (void)btnHeartBeat0TouchUpInside
{
    [self becomeActivedSelectorAndDelegateEvent];
}


#pragma mark - ButtonEffectTypeHeartBeat1
- (void)btnHeartBeat1TouchDown
{
    [self becomeActivedSelectorAndDelegateEvent];
}

- (void)btnHeartBeat1TouchUpInside
{
    [self becomeActivedSelectorAndDelegateEvent];
}

#pragma mark - ButtonEffectTypeRise
- (void)btnImageRiseTouchUpInside
{
	[self becomeActivedSelectorAndDelegateEvent];
}

#pragma mark - ButtonEffectTypeLoad
- (void)btnStartLoadTouchUpInside
{
	[self becomeActivedSelectorAndDelegateEvent];
}


#pragma mark - ButtonEffectTypeLoad1
- (void)btnStartLoad1TouchUpInside
{
	[self becomeActivedSelectorAndDelegateEvent];
}


#pragma mark - ButtonEffectTypeProgress
- (void)btnProgressTouchUpInside
{
    [self becomeActivedSelectorAndDelegateEvent];
}


#pragma mark - ButtonEffectTypeThrow
- (void)btnThrowTouchUpInside
{
    [self becomeActivedSelectorAndDelegateEvent];
}


#pragma mark - ButtonEffectTypeRipple
- (void)btnDisplayRippleTouchUpInside
{
	[self becomeActivedSelectorAndDelegateEvent];
}

#pragma mark - ButtonEffectTypeMark
- (void)btnDisplayMarkTouchUpInside
{
	[self becomeActivedSelectorAndDelegateEvent];
}


#pragma mark - setter/getter

- (void)setSelected:(BOOL)selected
{
    _selected = selected;
    if(_selected){ // 状态变为selected了，说明load动画完成了。
        self.controlState = UIControlStateSelected;
    }else{
        self.controlState = UIControlStateNormal;
    }
}

- (void)setControlState:(UIControlState)controlState
{
    _controlState = controlState;
    switch (controlState)
    {
        case UIControlStateNormal:
        {
            [self dataDisplay:UIControlStateNormal];
        }
            break;
        case UIControlStateSelected:
        {
            [self dataDisplay:UIControlStateSelected];
        }
            break;

            
        default:
            break;
    }
}

- (void)setEffectType:(ButtonEffectType)effectType
{
    _effectType = effectType;
    if(effectType == ButtonEffectTypeLoad){
        self.duration = 2.5;
        self.scale = 0.1;
    }

    [self createCustomLayers];
    [self addClickEvent];
}


- (void)dataDisplay:(UIControlState)state
{
    
}

@end
