//
//  CoolAnimationManager.h
//  0213Demo
//
//  Created by 王亚文 on 2017/2/21.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CoolButton.h"

@class CoolAnimationManager;
@protocol CoolAnimationManagerDelegate <NSObject>

- (void)animationManagerDidStart:(CoolAnimationManager *)manager animation:(CAAnimation *)animation;
- (void)animationManagerDidStop:(CoolAnimationManager *)manager animation:(CAAnimation *)animation;
@end



@interface CoolAnimationManager : NSObject


@property (nonatomic, weak)id<CoolAnimationManagerDelegate>			animationManagerDelegate;


+ (CoolAnimationManager *)shareInstance;


#pragma mark - ButtonEffectTypeScale

- (void)addAnimationEffectTypeScaleOfGoSmall:(CoolButton *)button onLayers:(NSArray<CALayer *> *)layers;

- (void)addAnimationEffectTypeScaleOfGoDefault:(CoolButton *)button onLayers:(NSArray<CALayer *> *)layers;


#pragma mark - ButtonEffectTypeHeartBeat0

- (void)addAnimationEffectTypeHeartBeat0OfKeyframeScale:(CoolButton *)button onLayers:(NSArray<CALayer *> *)layers;


#pragma mark - ButtonEffectTypeHeartBeat1

- (void)addAnimationEffectTypeHeartBeat1OfOpacityScale:(CoolButton *)button onLayers:(NSArray<CALayer *> *)layers;


#pragma mark - ButtonEffectTypeRise

- (void)addAnimationEffectTypeHeartRiseOfPositionOpacityScale:(CoolButton *)button onLayers:(NSArray<CALayer *> *)layers;


#pragma mark - ButtonEffectTypeLoad

- (void)addAnimationEffectTypeTypeLoadOfOpacityScale:(CoolButton *)button onLayers:(NSArray<CALayer *> *)layers;


#pragma mark - ButtonEffectTypeLoad1

- (void)addAnimationEffectTypeTypeLoad1OfTextLoad:(CoolButton *)button onLayers:(NSArray<CALayer *> *)layers;

#pragma mark - ButtonEffectTypeProgress

- (void)addAnimationEffectTypeProgress:(CoolButton *)button onLayers:(NSArray<CALayer *> *)layers;


#pragma mark - ButtonEffectTypeThrow

- (void)addAnimationEffectTypeThrow:(CoolButton *)button onLayers:(NSArray<CALayer *> *)layers;


#pragma mark - ButtonEffectTypeRipple

- (void)addAnimationEffectTypeRipple:(CoolButton *)button onLayers:(NSArray<CALayer *> *)layers;




#pragma mark - ButtonEffectTypeMark


@end
