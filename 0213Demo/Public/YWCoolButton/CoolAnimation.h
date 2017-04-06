//
//  CoolAnimationManager.h
//  0213Demo
//
//  Created by 王亚文 on 2017/2/21.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface CoolAnimation : NSObject



+ (CABasicAnimation *)basicAnimationWithKeyPath:(NSString *)keyPath
                                      fromValue:(id)fromValue
                                        toValue:(id)toValue
                                       duration:(CFTimeInterval)duration;

+ (CAKeyframeAnimation *)keyframeAnimationWithKeyPath:(NSString *)keyPath
                                               values:(NSArray *)values
                                             keyTimes:(NSArray<NSNumber *> *)keyTimes
                                             duration:(CFTimeInterval)duration;

//+ (CAKeyframeAnimation *)keyframeAnimationWithKeyPath:(NSString *)keyPath
//                                                 path:()
//                                               values:(NSArray *)values
//                                             keyTimes:(NSArray<NSNumber *> *)keyTimes
//                                             duration:(CFTimeInterval)duration;

+ (CAAnimationGroup *)groupAnimationWithAnimations:(NSArray<CAAnimation *> *)animations
                                          duration:(CFTimeInterval)duration;


@end
