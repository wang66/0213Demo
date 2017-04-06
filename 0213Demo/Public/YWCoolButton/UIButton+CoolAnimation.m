//
//  UIButton+CoolAnimation.m
//  0213Demo
//
//  Created by 王亚文 on 2017/2/22.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "UIButton+CoolAnimation.h"

@implementation UIButton (CoolAnimation)

- (void)removeAllActions
{
    [self removeTarget:nil action:NULL forControlEvents:UIControlEventAllTouchEvents];
}

@end
