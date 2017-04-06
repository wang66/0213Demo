//
//  UIView+YWFrame.m
//  RunEduAgency
//
//  Created by 王亚文 on 2017/1/5.
//  Copyright © 2017年 szzjcs. All rights reserved.
//

#import "UIView+YWFrame.h"

@implementation UIView (YWFrame)

- (CGFloat)yw_x
{
    return self.frame.origin.x;
}
- (void)setYw_x:(CGFloat)yw_x
{
    CGRect frame = CGRectZero;
    frame.origin.x = yw_x;
    self.frame = frame;
}

- (CGFloat)yw_y
{
    return self.frame.origin.y;
}
- (void)setYw_y:(CGFloat)yw_y
{
    CGRect frame = CGRectZero;
    frame.origin.y = yw_y;
    self.frame = frame;
}

- (CGPoint)yw_origin
{
    return self.frame.origin;
}
- (void)setYw_origin:(CGPoint)yw_origin
{
    CGRect frame = CGRectZero;
    frame.origin = yw_origin;
    self.frame = frame;
}

- (CGFloat)yw_width
{
    return self.frame.size.width;
}
- (void)setYw_width:(CGFloat)yw_width
{
    CGRect frame = CGRectZero;
    frame.size.width = yw_width;
    self.frame = frame;
}

- (CGFloat)yw_height
{
    return self.frame.size.height;
}
- (void)setYw_height:(CGFloat)yw_height
{
    CGRect frame = CGRectZero;
    frame.size.height = yw_height;
    self.frame = frame;
}

- (CGSize)yw_size
{
    return self.frame.size;
}
- (void)setYw_size:(CGSize)yw_size
{
    CGRect frame = CGRectZero;
    frame.size = yw_size;
    self.frame = frame;
}


- (CGFloat)yw_top
{
    return self.frame.origin.y;
}

- (CGFloat)yw_bottom
{
    return self.yw_top+self.yw_height;
}

- (CGFloat)yw_left
{
    return self.frame.origin.x;
}

- (CGFloat)yw_right
{
    return self.yw_left+self.yw_width;
}
@end
