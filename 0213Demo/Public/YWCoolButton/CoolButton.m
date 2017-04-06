//
//  CoolButton.m
//  0213Demo
//
//  Created by ZJCS on 17/2/17.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "CoolButton.h"
#import "UIView+YWFrame.h"
#import "CoolAnimation.h"
#import "CoolAnimationManager.h"


@interface CoolButton()<CoolAnimationManagerDelegate>

//@property (nonatomic, strong)UIView			*backgroundView;
//
//@property (nonatomic, strong)UILabel		*textLabel;
//
//@property (nonatomic, strong)UIImageView	*imageView;

//@property (nonnull, strong)CALayer          *maskLayer;
//
//@property (nonnull, strong)CATextLayer      *maskTextLayer;

@property (nonatomic, strong)CAReplicatorLayer  *replicatorLayer;

@property (nonatomic, strong)CoolAnimationManager   *animationManger;


@end


@implementation CoolButton

- (instancetype)initWithFrame:(CGRect)frame
{
	return [self initWithFrame:frame buttonEffectType:ButtonEffectTypeNone];
}

- (instancetype)initWithFrame:(CGRect)frame buttonEffectType:(ButtonEffectType)effectType
{
	if(self = [super initWithFrame:frame buttonEffectType:effectType])
	{
        self.dataPool = [[DataPool alloc] init];
        self.animationManger = [CoolAnimationManager shareInstance];
        self.animationManger.animationManagerDelegate = self;
        
		self.text = @"";
		self.textColor = [UIColor lightTextColor];
		self.font = [UIFont systemFontOfSize:13];
        
		self.backgroundView = [[UIView alloc] initWithFrame:self.bounds];
		self.backgroundView.backgroundColor = [UIColor clearColor];
		self.backgroundView.userInteractionEnabled = NO;
		[self.containerView addSubview:self.backgroundView];
		
		self.imageView = [[UIImageView alloc] init];
		self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.imageView.contentScaleFactor = [UIScreen mainScreen].scale;
		self.imageView.userInteractionEnabled = NO;
		[self.backgroundView addSubview:self.imageView];
		
		self.textLabel = [[UILabel alloc] init];
		self.textLabel.userInteractionEnabled = NO;
		[self.textLabel sizeToFit];
		[self.backgroundView addSubview:self.textLabel];
        
        [self createCustomLayers];
	}
	
	return self;
}


- (void)clearCustomLayers
{
    if(self.backgroundView)
    {
        [self.maskLayer removeFromSuperlayer];
        self.maskLayer = nil;
        [self.replicatorLayer removeFromSuperlayer];
        self.replicatorLayer = nil;
    }
}

- (void)createCustomLayers
{
    // 再进行添加subLayer之前，先清理一次
    [self clearCustomLayers];
    
    if(self.effectType == ButtonEffectTypeHeartBeat0 ||self.effectType == ButtonEffectTypeHeartBeat1 || self.effectType == ButtonEffectTypeRise || self.effectType == ButtonEffectTypeRipple || self.effectType == ButtonEffectTypeThrow)
    {
        if(!self.maskLayer&&self.backgroundView){
            self.maskLayer = [CALayer layer];
            self.maskLayer.contentsGravity = kCAGravityResizeAspectFill;
			
            if(self.effectType!=ButtonEffectTypeThrow){
                self.maskLayer.backgroundColor = [UIColor clearColor].CGColor;
                self.maskLayer.opacity = 0;
            }
            
			// 剪切掉超出按钮的水波纹
			if(self.effectType == ButtonEffectTypeRipple){
				self.backgroundView.layer.masksToBounds = YES;
                self.maskLayer.backgroundColor = [UIColor whiteColor].CGColor;
                self.maskLayer.cornerRadius = self.maskLayer.bounds.size.width/2.f;
                self.maskLayer.masksToBounds = YES;
                self.maskLayer.opacity = 0;
			}
            
            [self.backgroundView.layer addSublayer:self.maskLayer];
        }
        
    }
    
    if(self.effectType == ButtonEffectTypeRise || self.effectType == ButtonEffectTypeLoad1){
        
        if(!self.maskTextLayer){
            self.maskTextLayer = [CATextLayer layer];
            self.maskTextLayer.contentsGravity = kCAGravityResizeAspectFill;
            
            if(self.effectType == ButtonEffectTypeLoad1){
                self.maskTextLayer.backgroundColor = self.bgColor.CGColor;
                self.maskTextLayer.opacity = 0;
            }else{
                self.maskTextLayer.backgroundColor = [UIColor clearColor].CGColor;
                self.maskTextLayer.opacity = 1;
            }
            self.maskTextLayer.contentsScale = [UIScreen mainScreen].scale;
            self.maskTextLayer.alignmentMode = kCAAlignmentCenter;
            self.maskTextLayer.foregroundColor = [UIColor redColor].CGColor;
			
            [self.backgroundView.layer addSublayer:self.maskTextLayer];
        }
    }
    
    else if(self.effectType == ButtonEffectTypeLoad){
        
        NSInteger count = 6;
        CGFloat angel = 2* M_PI/count;
        
        if(!self.replicatorLayer&&self.backgroundView){
            self.replicatorLayer = [CAReplicatorLayer layer];
            self.replicatorLayer.backgroundColor = [UIColor clearColor].CGColor;
            self.replicatorLayer.instanceCount = count;
            self.replicatorLayer.instanceDelay = self.duration/count;
            self.replicatorLayer.instanceTransform = CATransform3DMakeRotation(angel, 0, 0, 1);
            self.replicatorLayer.masksToBounds = YES;
            self.replicatorLayer.hidden = YES;
            [self.backgroundView.layer addSublayer:self.replicatorLayer];
        }
        
        if(!self.maskLayer&&self.backgroundView){
            self.maskLayer = [CALayer layer];
            self.maskLayer.transform = CATransform3DMakeScale(0, 0, 0);
            self.maskLayer.backgroundColor = [UIColor whiteColor].CGColor;
            [self.replicatorLayer addSublayer:self.maskLayer];
        }
    }
	
	

}

- (void)layoutSubviews
{
	[super layoutSubviews];

	self.imageView.frame = CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);
	self.textLabel.frame = CGRectMake(0, 0, 100.f, self.textLabel.font.lineHeight);
	self.textLabel.backgroundColor = ClearColor;
	[self.textLabel sizeToFit];
	
	
	if(self.text.length>0&&self.image){
		self.imageView.center = CGPointMake(self.backgroundView.center.x-self.textLabel.yw_width/2.f-self.spacing/2.f, self.backgroundView.center.y);
		self.textLabel.center = CGPointMake(self.backgroundView.center.x+self.imageView.yw_width/2.f+self.spacing/2.f, self.backgroundView.center.y);
	}else if(!self.text||self.text.length==0){
		self.imageView.center = CGPointMake(self.backgroundView.center.x, self.backgroundView.center.y);
		
	}else if(!self.image){
		self.textLabel.center = CGPointMake(self.backgroundView.center.x, self.backgroundView.center.y);
	}
	
	
	// 以下均为有浮层的
    if(self.effectType == ButtonEffectTypeHeartBeat1 || self.effectType == ButtonEffectTypeRise || self.effectType == ButtonEffectTypeRipple || self.effectType == ButtonEffectTypeThrow || self.effectType == ButtonEffectTypeLoad || self.effectType == ButtonEffectTypeLoad1)
    {
        CGPoint imgViewCenter = self.imageView.center;
        CGRect imgViewBounds = CGRectMake(0, 0, self.imageView.frame.size.width, self.imageView.frame.size.height);
        
        CGPoint textLabCenter = self.textLabel.center;
        CGRect textLabBounds = CGRectMake(0, 0, self.textLabel.frame.size.width, self.textLabel.frame.size.height);
		
		// ButtonEffectTypeRipple 仿安卓点击水纹浮层效果
		if(self.effectType == ButtonEffectTypeRipple)
		{
			[CATransaction begin];
			[CATransaction setDisableActions:YES];
			self.maskLayer.position = self.button.touchPoint;
			[CATransaction commit];
			self.maskLayer.bounds = CGRectMake(0, 0, self.bounds.size.height/2.f, self.bounds.size.height/2.f);
			self.maskLayer.cornerRadius = self.maskLayer.bounds.size.width/2.f;
		}
        
        else if(self.effectType == ButtonEffectTypeLoad)
        {
            self.replicatorLayer.position = self.backgroundView.center;
            self.replicatorLayer.bounds = CGRectMake(0, 0, self.yw_width, self.yw_height);
            self.maskLayer.bounds = CGRectMake(0, 0, 3.f, 3.f);
            self.maskLayer.position = CGPointMake(self.bounds.size.width/2.f-self.spacing, self.bounds.size.height/2.f-self.spacing);
            self.maskLayer.cornerRadius = self.maskLayer.bounds.size.width/2.f;
        }
        
        else if(self.effectType == ButtonEffectTypeLoad1)
        {
            self.maskTextLayer.position = self.backgroundView.center;
            self.maskTextLayer.bounds = CGRectMake(0, 0, self.backgroundView.frame.size.width, self.textLabel.font.lineHeight);
        }
		
		else
		{
			
			if(self.maskContent)
			{
				if([self.maskContent isKindOfClass:[NSString class]])
				{
					if([self imageForState:self.controlState]&&[self textForState:self.controlState].length>0){
						self.maskTextLayer.position = textLabCenter;
						self.maskTextLayer.bounds = textLabBounds;
					}else{
						if([self imageForState:self.controlState]){
							self.maskTextLayer.position = imgViewCenter;
							self.maskTextLayer.bounds = imgViewBounds;
						}else if([self textForState:self.controlState]){
							self.maskTextLayer.position = textLabCenter;
							self.maskTextLayer.bounds = textLabBounds;
						}
					}
					
					self.maskLayer.position = imgViewCenter;
					self.maskLayer.bounds = imgViewBounds;
					
					
				}else if([self.maskContent isKindOfClass:[UIImage class]]){
					if([self imageForState:self.controlState]&&[self textForState:self.controlState]){
						self.maskLayer.position = imgViewCenter;
						self.maskLayer.bounds = imgViewBounds;
					}else{
						if([self imageForState:self.controlState]){
							self.maskLayer.position = imgViewCenter;
							self.maskLayer.bounds = imgViewBounds;
						}else if([self textForState:self.controlState]){
							self.maskLayer.position = textLabCenter;
							self.maskLayer.bounds = textLabBounds;
						}
					}
					
				}
				
			}
			else{
				if([self imageForState:self.controlState]&&[self textForState:self.controlState]){
					self.maskLayer.position = imgViewCenter;
					self.maskLayer.bounds = imgViewBounds;
				}else{
					if([self imageForState:self.controlState]){
						self.maskLayer.position = imgViewCenter;
						self.maskLayer.bounds = imgViewBounds;
					}else if([self textForState:self.controlState]){
						self.maskLayer.position = textLabCenter;
						self.maskLayer.bounds = textLabBounds;
					}
				}
				
			}

		}
		
		
            }
}


#pragma mark - ButtonEffectTypeNone

/**
 无任何动画
 */
- (void)btnNone
{
    [super btnNone];
}

#pragma mark - ButtonEffectTypeScale

- (void)btnScaleToSmall
{
	[super btnScaleToSmall];
	
     [self.animationManger addAnimationEffectTypeScaleOfGoSmall:self onLayers:@[self.layer, self.imageView.layer, self.textLabel.layer]];
	
}

- (void)btnScaleToDefault
{
	[super btnScaleToDefault];
	
    [self.animationManger addAnimationEffectTypeScaleOfGoDefault:self
                                                        onLayers:@[self.layer, self.imageView.layer, self.textLabel.layer]];
}



#pragma mark - ButtonEffectTypeHeartBeat0

- (void)btnHeartBeat0TouchDown
{
    [super btnHeartBeat0TouchDown];
}

- (void)btnHeartBeat0TouchUpInside
{
    [super btnHeartBeat0TouchUpInside];
    
    if(self.selected)
    {        
        [self.animationManger addAnimationEffectTypeHeartBeat0OfKeyframeScale:self
                                                                     onLayers:@[self.imageView.layer]];
    }
}


#pragma mark - ButtonEffectTypeHeartBeat1

- (void)btnHeartBeat1TouchDown
{
    [super btnHeartBeat1TouchDown];
}

- (void)btnHeartBeat1TouchUpInside
{
    [super btnHeartBeat1TouchUpInside];
    
    if(self.selected)
    {
        [self.animationManger addAnimationEffectTypeHeartBeat1OfOpacityScale:self
                                                                    onLayers:@[self.maskLayer]];
    }
}


#pragma mark - ButtonEffectTypeRise

- (void)btnImageRiseTouchUpInside
{
	[super btnImageRiseTouchUpInside];
    
    if(self.selected)
    {
        self.maskTextLayer.hidden = NO;
        
        [self.animationManger addAnimationEffectTypeHeartRiseOfPositionOpacityScale:self
                                                                           onLayers:@[self.maskTextLayer,
																					  self.maskTextLayer,
																					  self.maskLayer]];
    }
    else
    {
        self.maskTextLayer.hidden = YES;
    }
    
}

#pragma mark - ButtonEffectTypeLoad

- (void)btnStartLoadTouchUpInside
{
	[super btnStartLoadTouchUpInside];
    
    if(!self.selected)
    {
        [self.animationManger addAnimationEffectTypeTypeLoadOfOpacityScale:self onLayers:@[self.maskLayer]];
    }
    else
    {
        
    }
}


#pragma mark - ButtonEffectTypeLoad1

- (void)btnStartLoad1TouchUpInside
{
	[super btnStartLoadTouchUpInside];
	
	if(!self.selected)
	{
//        self.maskTextLayer.hidden = NO;
        [self.animationManger addAnimationEffectTypeTypeLoad1OfTextLoad:self onLayers:@[self.maskTextLayer]];
	}
	else
	{
//		self.maskTextLayer.hidden = YES;
	}
}



#pragma mark - ButtonEffectTypeProgress

- (void)btnProgressTouchUpInside
{
    [super btnProgressTouchUpInside];
}


#pragma mark - ButtonEffectTypeThrow

- (void)btnThrowTouchUpInside
{
    [super btnThrowTouchUpInside];

    [self.animationManger addAnimationEffectTypeThrow:self onLayers:@[self.maskLayer]];
}


#pragma mark - ButtonEffectTypeRipple

- (void)btnDisplayRippleTouchUpInside
{
	[super btnDisplayRippleTouchUpInside];
	
	[self setNeedsLayout];
	
	[self.animationManger addAnimationEffectTypeRipple:self onLayers:@[self.maskLayer]];
	
	
}


#pragma mark - ButtonEffectTypeMark

- (void)btnDisplayMarkTouchUpInside
{
	[super btnDisplayMarkTouchUpInside];
}




#pragma mark - custom setter

- (void)setText:(NSString *)text forState:(UIControlState)state
{
    [self.dataPool saveText:text state:state];
    [self dataDisplay:self.controlState];
}

- (void)setTextColor:(UIColor *)textColor forState:(UIControlState)state
{
//    _textColor = textColor;
    [self.dataPool saveTextColor:textColor state:state];
    [self dataDisplay:self.controlState];
}

- (void)setFont:(UIFont *)font forState:(UIControlState)state
{
//    _font = font;
    [self.dataPool saveFont:font state:state];
    [self dataDisplay:self.controlState];
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
//    _image = image;
    [self.dataPool saveImage:image state:state];
    [self dataDisplay:self.controlState];
}

- (void)setMaskTextColor:(UIColor *)maskTextColor forState:(UIControlState)state
{
	[self.dataPool saveMaskTextColor:maskTextColor state:state];
	[self dataDisplay:self.controlState];
}

- (void)setBgColor:(UIColor *)bgColor forState:(UIControlState)state
{
	if(state==UIControlStateNormal){
		[self.dataPool saveBackgroundColor:bgColor state:UIControlStateNormal];
		[self.dataPool saveBackgroundColor:bgColor state:UIControlStateSelected];
	}else{
		[self.dataPool saveBackgroundColor:bgColor state:state];
	}
	
	[self dataDisplay:self.controlState];
}

- (void)setBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state
{
//    _backgroundImage = backgroundImage;
    [self.dataPool savebackgroundImage:backgroundImage state:state];
    [self dataDisplay:self.controlState];
}


#pragma mark - overWrite setter
/**
 overWrite setter, default normal state

 @param text text description
 */
- (void)setText:(NSString *)text
{
    [self setText:text forState:UIControlStateNormal];
}

- (void)setTextColor:(UIColor *)textColor
{
    [self setTextColor:textColor forState:UIControlStateNormal];
}

- (void)setFont:(UIFont *)font
{
    [self setFont:font forState:UIControlStateNormal];
}

- (void)setImage:(UIImage *)image
{
    [self setImage:image forState:UIControlStateNormal];
}

- (void)setMaskTextColor:(UIColor *)maskTextColor
{
	[self setMaskTextColor:maskTextColor forState:UIControlStateNormal];
}

- (void)setBgColor:(UIColor *)bgColor
{
	[self setBgColor:bgColor forState:UIControlStateNormal];
	[self setBgColor:bgColor forState:UIControlStateSelected];
}

- (void)setMaskContent:(id)maskContent
{
    _maskContent = maskContent;
    if(self.maskContent)
    {
        if([self.maskContent isKindOfClass:[NSString class]]){
            self.maskTextLayer.string = (NSString *)maskContent;
            self.maskTextLayer.fontSize = 12;
            if(self.effectType == ButtonEffectTypeLoad1){
                self.maskTextLayer.hidden = NO;
            }else{
                self.maskTextLayer.hidden = YES;
            }
            
            
        }else if([self.maskContent isKindOfClass:[UIImage class]]){
            maskContent = (UIImage *)maskContent;
            self.maskLayer.contents = maskContent;
        }
    }
    [self setNeedsLayout];
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
}

- (void)setControlState:(UIControlState)controlState
{
    [super setControlState:controlState];
}

#pragma mark - custom getter

- (NSString *)textForState:(UIControlState)state
{
    return [self.dataPool textState:state];
}

- (UIColor *)textColorForState:(UIControlState)state
{
    return [self.dataPool textColorState:state];
}

- (UIFont *)fontForState:(UIControlState)state
{
    return [self.dataPool fontState:state];
}

- (UIImage *)imageForState:(UIControlState)state
{
    return [self.dataPool imageState:state];
}

- (UIImage *)backgroundImageForState:(UIControlState)state
{
    return [self.dataPool backgroundImageState:state];
}


#pragma mark - overWrite getter

- (NSString *)text
{
    return [self textForState:UIControlStateNormal];
}

- (UIColor *)textColor
{
    return [self textColorForState:UIControlStateNormal];
}

- (UIFont *)font
{
    return [self fontForState:UIControlStateNormal];
}

- (UIImage *)image
{
    return [self imageForState:UIControlStateNormal];
}

- (UIImage *)backgroundImage
{
    return [self backgroundImageForState:UIControlStateNormal];
}

- (void)dataDisplay:(UIControlState)state
{
    [super dataDisplay:state];
    
    NSString *text = [self.dataPool textState:state];
    self.textLabel.text = text;
    self.textLabel.textColor = [self.dataPool textColorState:state];
    self.textLabel.font = [self.dataPool fontState:state];
    if(self.effectType == ButtonEffectTypeHeartBeat0 ||self.effectType == ButtonEffectTypeHeartBeat1 || self.self.effectType == ButtonEffectTypeRise){
        self.maskLayer.contents = (__bridge id _Nullable)([self.dataPool imageState:state].CGImage);
    }
	else if(self.effectType == ButtonEffectTypeThrow){
		UIImage *maskContent = (UIImage *)self.maskContent;
		self.maskLayer.contents = (__bridge id _Nullable)maskContent.CGImage;
	}
    
    self.imageView.image = [self.dataPool imageState:state];
    [self.button setBackgroundImage:[self.dataPool backgroundImageState:state] forState:state];
	
	self.backgroundColor = [self.dataPool backgroundColorState:state];
	
	UIColor *maskTextColor;
	if(self.effectType == ButtonEffectTypeLoad1 || self.effectType == ButtonEffectTypeRise){
		if([self.dataPool maskTextColorState:state]){
			maskTextColor = [self.dataPool maskTextColorState:state];
		}else{
			maskTextColor = self.textColor;
		}
		self.maskTextLayer.foregroundColor = maskTextColor.CGColor;
	}
	
	
    [self setNeedsLayout];
}






/**
 只适用于ButtonEffectTypeLoad类型
 */
- (void)beginLoad
{
    self.replicatorLayer.hidden = NO;
    self.maskLayer.hidden = NO;
	self.maskTextLayer.hidden = NO;
    self.replicatorLayer.backgroundColor = self.backgroundColor.CGColor;
	
	self.textLabel.hidden = YES;
	self.imageView.hidden = YES;
}

- (void)endLoad
{
    self.replicatorLayer.hidden = YES;
    self.maskLayer.hidden = YES;
    self.maskTextLayer.hidden = YES;
    self.replicatorLayer.backgroundColor = [UIColor clearColor].CGColor;
	
	self.textLabel.hidden = NO;
	self.imageView.hidden = NO;
}


#pragma mark - CoolAnimationManagerDelegate

- (void)animationManagerDidStart:(CoolAnimationManager *)manager animation:(CAAnimation *)animation
{
    if([self.buttonAnimationDelegate respondsToSelector:@selector(coolButtonDidStart:animation:)]){
        [self.buttonAnimationDelegate coolButtonDidStart:self animation:animation];
    }
    
}

- (void)animationManagerDidStop:(CoolAnimationManager *)manager animation:(CAAnimation *)animation
{
    if([self.buttonAnimationDelegate respondsToSelector:@selector(coolButtonDidStart:animation:)]){
        [self.buttonAnimationDelegate coolButtonDidStop:self animation:animation];
    }
}


@end
