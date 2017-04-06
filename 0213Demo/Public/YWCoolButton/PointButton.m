//
//  PointButton.m
//  0213Demo
//
//  Created by ZJCS on 17/2/23.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "PointButton.h"

@implementation PointButton


- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
	CGPoint touchPoint = [touch locationInView:self];
	self.touchPoint = touchPoint;
	
	return [super beginTrackingWithTouch:touch withEvent:event];
}


@end
