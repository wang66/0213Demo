//
//  UIView+YWFrame.h
//  RunEduAgency
//
//  Created by 王亚文 on 2017/1/5.
//  Copyright © 2017年 szzjcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YWFrame)
@property (nonatomic, assign) CGFloat   yw_x;
@property (nonatomic, assign) CGFloat   yw_y;
@property (nonatomic, assign) CGPoint   yw_origin;
@property (nonatomic, assign) CGFloat   yw_width;
@property (nonatomic, assign) CGFloat   yw_height;
@property (nonatomic, assign) CGSize    yw_size;

// 布局
@property (nonatomic, assign, readonly) CGFloat   yw_top;
@property (nonatomic, assign, readonly) CGFloat   yw_bottom;
@property (nonatomic, assign, readonly) CGFloat   yw_left;
@property (nonatomic, assign, readonly) CGFloat   yw_right;
@end
