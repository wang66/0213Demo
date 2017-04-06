//
//  UIColor+Function.m
//  0213Demo
//
//  Created by ZJCS on 17/2/16.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "UIColor+Function.h"

@implementation UIColor (Function)

+ (UIColor *)randomColor
{
	int R = (arc4random() % 255);
	int G = (arc4random() % 255);
	int B = (arc4random() % 255);
	
	return [UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:1];
}

@end
