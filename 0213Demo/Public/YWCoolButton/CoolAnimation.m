//
//  CoolAnimationManager.m
//  0213Demo
//
//  Created by 王亚文 on 2017/2/21.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "CoolAnimation.h"

@interface CoolAnimation ()<CAAnimationDelegate>

@end

@implementation CoolAnimation

+ (CABasicAnimation *)basicAnimationWithKeyPath:(NSString *)keyPath
                                      fromValue:(id)fromValue
                                        toValue:(id)toValue
                                       duration:(CFTimeInterval)duration
{
    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    basicAnimation.keyPath = keyPath;
    basicAnimation.fromValue = fromValue;
    basicAnimation.toValue = toValue;
    basicAnimation.duration = duration;
    basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    basicAnimation.removedOnCompletion = NO;
    basicAnimation.fillMode = kCAFillModeForwards;
    
    return basicAnimation;
}

+ (CAKeyframeAnimation *)keyframeAnimationWithKeyPath:(NSString *)keyPath
                                               values:(NSArray *)values
                                             keyTimes:(NSArray<NSNumber *> *)keyTimes
                                             duration:(CFTimeInterval)duration
{
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animation];
    keyframeAnimation.keyPath = keyPath;
    keyframeAnimation.values = values;
    keyframeAnimation.duration = duration;
    keyframeAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    keyframeAnimation.removedOnCompletion = NO;
    keyframeAnimation.fillMode = kCAFillModeForwards;
    
    return keyframeAnimation;
}

+ (CAAnimationGroup *)groupAnimationWithAnimations:(NSArray<CAAnimation *> *)animations
                                          duration:(CFTimeInterval)duration
{
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = animations;
    groupAnimation.duration = duration;
    groupAnimation.removedOnCompletion = NO;
    groupAnimation.fillMode = kCAFillModeForwards;
    groupAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    return groupAnimation;
}

@end
