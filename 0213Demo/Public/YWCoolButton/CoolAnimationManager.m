//
//  CoolAnimationManager.m
//  0213Demo
//
//  Created by 王亚文 on 2017/2/21.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "CoolAnimationManager.h"
#import "CoolAnimation.h"


//#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_3
//@interface CoolAnimationManager ()<CAAnimationDelegate>
//#else
@interface CoolAnimationManager ()
//#endif


@end

@implementation CoolAnimationManager

//static CoolAnimationManager *sharedInstance = nil;

+ (CoolAnimationManager *)shareInstance
{
//	static dispatch_once_t p;
//	dispatch_once(&p, ^{
//		sharedInstance = [[self alloc] init];
//	});
//	return sharedInstance;
	CoolAnimationManager *manager = [[CoolAnimationManager alloc] init];
	return manager;
}


#pragma mark - ButtonEffectTypeScale

- (void)addAnimationEffectTypeScaleOfGoSmall:(CoolButton *)button onLayers:(NSArray<CALayer *> *)layers
{
    if(!layers||layers.count==0){
        return;
    }
    
    // btn scale 变小
	CABasicAnimation *btnScaleAnimation = [CoolAnimation basicAnimationWithKeyPath:@"transform.scale"
																						 fromValue:nil
																						   toValue:@(button.scale)
																						  duration:button.duration];
    // imgView scale 变大
    CABasicAnimation *imgVScaleAnimation = [CoolAnimation basicAnimationWithKeyPath:@"transform.scale"
                                                                          fromValue:nil
                                                                            toValue:@(1+(1-button.scale))
                                                                           duration:button.duration];
    // textLabel scale 变大
    CABasicAnimation *labScaleAnimation = [CoolAnimation basicAnimationWithKeyPath:@"transform.scale"
                                                                         fromValue:nil
                                                                           toValue:@(1+(1-button.scale))
                                                                          duration:button.duration];
	
	[[CoolAnimationManager shareInstance] addAnimations:@[btnScaleAnimation, imgVScaleAnimation, labScaleAnimation]
											   onLayers:layers];
	

}

- (void)addAnimationEffectTypeScaleOfGoDefault:(CoolButton *)button onLayers:(NSArray<CALayer *> *)layers
{
    if(!layers||layers.count==0){
        return;
    }
    
    // btn scale 恢复
    CABasicAnimation *btnScaleAnimation = [CoolAnimation basicAnimationWithKeyPath:@"transform.scale"
                                                                         fromValue:nil
                                                                           toValue:@(1)
                                                                          duration:button.duration];
    
    // imgView scale 恢复
    CABasicAnimation *imgVScaleAnimation = [CoolAnimation basicAnimationWithKeyPath:@"transform.scale"
                                                                          fromValue:nil
                                                                            toValue:@(1)
                                                                           duration:button.duration];

    // imgView scale 恢复
    CABasicAnimation *labScaleAnimation = [CoolAnimation basicAnimationWithKeyPath:@"transform.scale"
                                                                         fromValue:nil
                                                                           toValue:@(1)
                                                                          duration:button.duration];

	[[CoolAnimationManager shareInstance] addAnimations:@[btnScaleAnimation, imgVScaleAnimation, labScaleAnimation]
											   onLayers:layers];

}


#pragma mark - ButtonEffectTypeHeartBeat0

- (void)addAnimationEffectTypeHeartBeat0OfKeyframeScale:(CoolButton *)button onLayers:(NSArray<CALayer *> *)layers
{
    if(!layers||layers.count==0){
        return;
    }
    
    // scale
    NSArray *values = @[@(0.5), @(1), @(button.multipleScale), @(0.6), @(1)];
    //        NSArray *keyTimes = @[]
    CAKeyframeAnimation *imgVScaleKeyframeAnimation = [CoolAnimation keyframeAnimationWithKeyPath:@"transform.scale"
                                                                                           values:values
                                                                                         keyTimes:nil
                                                                                         duration:button.duration];

	[[CoolAnimationManager shareInstance] addAnimations:@[imgVScaleKeyframeAnimation] onLayers:layers];
}


#pragma mark - ButtonEffectTypeHeartBeat1

- (void)addAnimationEffectTypeHeartBeat1OfOpacityScale:(CoolButton *)button onLayers:(NSArray<CALayer *> *)layers
{
    if(!layers||layers.count==0){
        return;
    }
    
    // opacity
    CABasicAnimation *opacityAnimation = [CoolAnimation basicAnimationWithKeyPath:@"opacity"
                                                                        fromValue:NumberFloat(1.f)
                                                                          toValue:NumberFloat(0.f)
                                                                         duration:button.duration];
    // scale
    CABasicAnimation *scaleAnimation = [CoolAnimation basicAnimationWithKeyPath:@"transform.scale"
                                                                      fromValue:NumberFloat(1.f)
                                                                        toValue:NumberFloat(button.multipleScale)
                                                                       duration:button.duration];
    // group
    CAAnimationGroup *groupAnimation = [CoolAnimation groupAnimationWithAnimations:@[opacityAnimation, scaleAnimation]
                                                                          duration:button.duration];
	
	[[CoolAnimationManager shareInstance] addAnimations:@[groupAnimation] onLayers:layers];
}


#pragma mark - ButtonEffectTypeRise

- (void)addAnimationEffectTypeHeartRiseOfPositionOpacityScale:(CoolButton *)button onLayers:(NSArray<CALayer *> *)layers
{
    if(!layers||layers.count==0){
        return;
    }
    
    NSValue *fromValue = nil;
    NSValue *toValue = nil;
    CALayer *targetLayer = nil;
	
	
	CALayer *anim = nil;
    if(button.maskContent&&[button.maskContent isKindOfClass:[NSString class]])
    {
        fromValue = ValuePoint(button.maskTextLayer.position);
        toValue = ValuePoint(CGPointMake(button.maskTextLayer.position.x, -button.maskTextLayer.bounds.size.height/2.f-button.spacing));
        targetLayer = button.maskTextLayer;
		anim = button.maskTextLayer;
    }
    else
    {
        fromValue = ValuePoint(button.maskLayer.position);
        toValue = ValuePoint(CGPointMake(button.maskLayer.position.x, -button.maskLayer.bounds.size.height/2.f-button.spacing));
        targetLayer = button.maskLayer;
		anim = button.maskLayer;
    }
    
    // position
    CABasicAnimation *positionAnimation = [CoolAnimation basicAnimationWithKeyPath:@"position"
                                                                         fromValue:fromValue
                                                                           toValue:toValue
                                                                          duration:button.duration];
    
    // opacity
    CABasicAnimation *opacityAnimation = [CoolAnimation basicAnimationWithKeyPath:@"opacity"
                                                                        fromValue:NumberFloat(0.9f)
                                                                          toValue:NumberFloat(0)
                                                                         duration:button.duration];
    
    // scale
    CAKeyframeAnimation *scaleAnimation = [CoolAnimation keyframeAnimationWithKeyPath:@"transform.scale"
                                                                            values:@[@(1), @(0.8), @(1)] keyTimes:nil
                                                                          duration:0.25];
	
	
	[[CoolAnimationManager shareInstance] addAnimations:@[positionAnimation, opacityAnimation, scaleAnimation]
											   onLayers:@[anim,anim, button.imageView.layer]];
	
}


#pragma mark - ButtonEffectTypeLoad

- (void)addAnimationEffectTypeTypeLoadOfOpacityScale:(CoolButton *)button onLayers:(NSArray<CALayer *> *)layers
{
    if(!layers||layers.count==0){
        return;
    }
    
    // opacity
    CABasicAnimation *opacityAnimation = [CoolAnimation basicAnimationWithKeyPath:@"opacity"
                                                                        fromValue:NumberFloat(0.9f)
                                                                          toValue:NumberFloat(0)
                                                                         duration:button.duration];
    
    // scale
    CAKeyframeAnimation *scaleAnimation = [CoolAnimation keyframeAnimationWithKeyPath:@"transform.scale"
                                                                            values:@[@1.5, @1, @0.5, @0]
                                                                          keyTimes:nil
                                                                          duration:button.duration];
    
    CAAnimationGroup *groupAnimation = [CoolAnimation groupAnimationWithAnimations:@[opacityAnimation, scaleAnimation]
                                                                         duration:button.duration];
    groupAnimation.repeatCount = MAXFLOAT;
    
    [[CoolAnimationManager shareInstance] addAnimations:@[groupAnimation]
											   onLayers:layers];
}


#pragma mark - ButtonEffectTypeLoad1

- (void)addAnimationEffectTypeTypeLoad1OfTextLoad:(CoolButton *)button onLayers:(NSArray<CALayer *> *)layers
{
    CABasicAnimation *opacityAnimation = [CoolAnimation basicAnimationWithKeyPath:@"opacity"
                                                                        fromValue:NumberFloat(0.9f)
                                                                          toValue:NumberFloat(0.9)
                                                                         duration:button.duration];
	
    [[CoolAnimationManager shareInstance] addAnimations:@[opacityAnimation] onLayers:layers];
}


#pragma mark - ButtonEffectTypeProgress

- (void)addAnimationEffectTypeProgress:(CoolButton *)button onLayers:(NSArray<CALayer *> *)layers
{

    
}


#pragma mark - ButtonEffectTypeThrow

- (void)addAnimationEffectTypeThrow:(CoolButton *)button onLayers:(NSArray<CALayer *> *)layers
{
    if(!layers||layers.count==0){
        return;
    }
    CALayer *layer = layers[0];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
	
    CGPoint startPoint = layer.position;
    CGPoint endPoint = CGPointMake([UIScreen mainScreen].bounds.size.width-button.imageView.frame.origin.x-40, -button.frame.origin.y-20.f);
    CGPoint controlPoint = CGPointMake(endPoint.x, startPoint.y-200);
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];
    [path addQuadCurveToPoint:endPoint
                 controlPoint:controlPoint];


    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.path = path.CGPath;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    pathAnimation.duration = button.duration;
    [layer addAnimation:pathAnimation forKey:nil];
	
    
    // rotation
    CABasicAnimation *rotationAnimation = [CoolAnimation basicAnimationWithKeyPath:@"transform.rotation"
                                                                         fromValue:NumberFloat(1)
                                                                           toValue:NumberFloat(1.5)
                                                                          duration:0.3];
    
    // opacity
    CABasicAnimation *opacityAnimation = [CoolAnimation basicAnimationWithKeyPath:@"opacity"
                                                                        fromValue:NumberFloat(1)
                                                                          toValue:NumberFloat(0.2)
                                                                         duration:button.duration];

    
    CAAnimationGroup *groupAnimation = [CoolAnimation groupAnimationWithAnimations:@[pathAnimation, rotationAnimation, opacityAnimation]
                                                                          duration:button.duration];

    groupAnimation.removedOnCompletion = YES;
    groupAnimation.fillMode = kCAFillModeRemoved;
	groupAnimation.delegate = self;
	
    [[CoolAnimationManager  shareInstance] addAnimations:@[groupAnimation] onLayers:layers];

}

#pragma mark - ButtonEffectTypeRipple

- (void)addAnimationEffectTypeRipple:(CoolButton *)button onLayers:(NSArray<CALayer *> *)layers
{
    // opacity
    CABasicAnimation *opacityAnimation = [CoolAnimation basicAnimationWithKeyPath:@"opacity"
                                                                        fromValue:NumberFloat(0.3)
                                                                          toValue:NumberFloat(0.25)
                                                                         duration:button.duration];
	
    // scale
	CGFloat scale = button.bounds.size.width;
    CABasicAnimation *scaleAnimation = [CoolAnimation basicAnimationWithKeyPath:@"transform.scale"
                                                                      fromValue:NumberFloat(1.f)
                                                                        toValue:NumberFloat(scale)
                                                                       duration:button.duration];
	
	CAAnimationGroup *groupAnimation = [CoolAnimation groupAnimationWithAnimations:@[opacityAnimation, scaleAnimation] duration:button.duration];
	groupAnimation.fillMode = kCAFillModeRemoved;
	groupAnimation.removedOnCompletion = YES;
	groupAnimation.delegate = self;
	[groupAnimation setValue:@"EffectTypeRipple" forKey:@"EffectTypeRipple"];
	
	[[CoolAnimationManager shareInstance] addAnimations:@[groupAnimation] onLayers:layers];
}










#pragma mark - ButtonEffectTypeMark



#pragma mark - function method 

- (void)addAnimations:(NSArray *)animations onLayers:(NSArray<CALayer *> *)layers
{
    if(!animations||!layers){
        return;
    }
    
    NSArray *tempArr = (layers.count<animations.count) ? [NSArray arrayWithArray:layers] : [NSArray arrayWithArray:animations];
    for(int i=0; i<tempArr.count; i++)
    {
        CALayer *layer = layers[i];
        [layer addAnimation:animations[i] forKey:nil];
    }
}



#pragma mark - CoolAnimationManagerDelegate

- (void)animationDidStart:(CAAnimation *)anim
{
	
	if([self.animationManagerDelegate respondsToSelector:@selector(animationManagerDidStart:animation:)])
	{
		[self.animationManagerDelegate animationManagerDidStart:self animation:anim];
	}
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
	if([self.animationManagerDelegate respondsToSelector:@selector(animationManagerDidStop:animation:)])
	{
		[self.animationManagerDelegate animationManagerDidStop:self animation:anim];
	}
}

@end
