//
//  DataPool.h
//  0213Demo
//
//  Created by 王亚文 on 2017/2/19.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface DataPool : NSObject

- (void)saveText:(NSString *)text state:(UIControlState)state;
- (NSString *)textState:(UIControlState)state;

- (void)saveTextColor:(UIColor *)textColor state:(UIControlState)state;
- (UIColor *)textColorState:(UIControlState)state;

- (void)saveFont:(UIFont *)font state:(UIControlState)state;
- (UIFont *)fontState:(UIControlState)state;

- (void)saveImage:(UIImage *)image state:(UIControlState)state;
- (UIImage *)imageState:(UIControlState)state;

- (void)saveMaskTextColor:(UIColor *)maskColor state:(UIControlState)state;
- (UIColor *)maskTextColorState:(UIControlState)state;

- (void)saveBackgroundColor:(UIColor *)backgroundColor state:(UIControlState)state;
- (UIColor *)backgroundColorState:(UIControlState)state;

- (void)savebackgroundImage:(UIImage *)backgroundImage state:(UIControlState)state;
- (UIImage *)backgroundImageState:(UIControlState)state;


@end
