//
//  DataPool.m
//  0213Demo
//
//  Created by 王亚文 on 2017/2/19.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "DataPool.h"

static NSString *const kText = @"kText";
static NSString *const kTextColor = @"kTextColor";
static NSString *const kFont = @"kFont";
static NSString *const kImage = @"kImage";
static NSString *const kMaskTextColor = @"kMaskTextColor";
static NSString *const kBackgroundColor = @"kBackgroundColor";
static NSString *const kBackgroundImage = @"kBackgroundImage";


@interface DataPool ()

@property (nonatomic, strong)NSMutableDictionary            *strDict;
@property (nonatomic, strong)NSMutableDictionary            *colorDict;
@property (nonatomic, strong)NSMutableDictionary            *fontDict;
@property (nonatomic, strong)NSMutableDictionary            *imageDict;

@end

@implementation DataPool

- (instancetype)init
{
    if(self = [super init]){
        _strDict = [NSMutableDictionary dictionary];
        _colorDict = [NSMutableDictionary dictionary];
        _fontDict = [NSMutableDictionary dictionary];
        _imageDict = [NSMutableDictionary dictionary];
    }
    
    return self;
}

- (void)saveText:(NSString *)text state:(UIControlState)state
{
    if(!text){
        return;
    }
    NSMutableDictionary *tempDict = [_strDict objectForKey:kText];
    if(!tempDict){
        tempDict = [NSMutableDictionary dictionary];
    }
    [tempDict setObject:text forKey:[NSString stringWithFormat:@"%ld", state]];
    [_strDict setObject:tempDict forKey:kText];
}

- (NSString *)textState:(UIControlState)state
{
    NSDictionary *tempDict = [_strDict objectForKey:kText];
    NSString *resultStr = (NSString *)[tempDict objectForKey:[NSString stringWithFormat:@"%ld", state]];
    if(resultStr){
        return resultStr;
    }else{
        return (NSString *)[tempDict objectForKey:[NSString stringWithFormat:@"%ld", UIControlStateNormal]];
    }
}

- (void)saveTextColor:(UIColor *)textColor state:(UIControlState)state
{
    if(!textColor){
        return;
    }
    
    NSMutableDictionary *tempDict = [_colorDict objectForKey:kTextColor];
    if(!tempDict){
        tempDict = [NSMutableDictionary dictionary];
    }
    [tempDict setObject:textColor forKey:[NSString stringWithFormat:@"%ld", state]];
    [_colorDict setObject:tempDict forKey:kTextColor];
}

- (UIColor *)textColorState:(UIControlState)state
{
    NSDictionary *tempDict = [_colorDict objectForKey:kTextColor];
    UIColor *resultColor = [tempDict objectForKey:[NSString stringWithFormat:@"%ld", state]];
    if(resultColor){
        return resultColor;
    }else{
        return (UIColor *)[tempDict objectForKey:[NSString stringWithFormat:@"%ld", UIControlStateNormal]];
    }

}

- (void)saveFont:(UIFont *)font state:(UIControlState)state
{
    if(!font){
        return;
    }
    
    NSMutableDictionary *tempDict = [_fontDict objectForKey:kFont];
    if(!tempDict){
        tempDict = [NSMutableDictionary dictionary];
    }
    [tempDict setObject:font forKey:[NSString stringWithFormat:@"%ld", state]];
    [_fontDict setObject:tempDict forKey:kFont];
}

- (UIFont *)fontState:(UIControlState)state
{
    NSDictionary *tempDict = [_fontDict objectForKey:kFont];
    UIFont *resultFont = [tempDict objectForKey:[NSString stringWithFormat:@"%ld", state]];
    if(resultFont){
        return resultFont;
    }else{
        return (UIFont *)[tempDict objectForKey:[NSString stringWithFormat:@"%ld", UIControlStateNormal]];
    }

}

- (void)saveImage:(UIImage *)image state:(UIControlState)state
{
    if(!image){
        return;
    }
    
    NSMutableDictionary *tempDict = [_imageDict objectForKey:kImage];
    if(!tempDict){
        tempDict = [NSMutableDictionary dictionary];
    }
    [tempDict setObject:image forKey:[NSString stringWithFormat:@"%ld", state]];
    [_imageDict setObject:tempDict forKey:kImage];
}

- (UIImage *)imageState:(UIControlState)state
{
    NSDictionary *tempDict = [_imageDict objectForKey:kImage];
    UIImage *resultImage = [tempDict objectForKey:[NSString stringWithFormat:@"%ld", state]];
    if(resultImage){
        return resultImage;
    }else{
        return (UIImage *)[tempDict objectForKey:[NSString stringWithFormat:@"%ld", UIControlStateNormal]];
    }
}

- (void)saveBackgroundColor:(UIColor *)backgroundColor state:(UIControlState)state
{
	if(!backgroundColor){
		return;
	}
	
	NSMutableDictionary *tempDict = [_colorDict objectForKey:kBackgroundColor];
	if(!tempDict){
		tempDict = [NSMutableDictionary dictionary];
	}
	[tempDict setObject:backgroundColor forKey:[NSString stringWithFormat:@"%ld", state]];
	[_colorDict setObject:tempDict forKey:kBackgroundColor];
}


- (UIColor *)backgroundColorState:(UIControlState)state
{
	NSDictionary *tempDict = [_colorDict objectForKey:kBackgroundColor];
	UIColor *resultBackgroundColor = [tempDict objectForKey:[NSString stringWithFormat:@"%ld", state]];
	if(resultBackgroundColor){
		return resultBackgroundColor;
	}else{
		return (UIColor *)[tempDict objectForKey:[NSString stringWithFormat:@"%ld", UIControlStateNormal]];
	}
}


- (void)saveMaskTextColor:(UIColor *)maskColor state:(UIControlState)state
{
	if(!maskColor){
		return;
	}
	
	NSMutableDictionary *tempDict = [_colorDict objectForKey:kMaskTextColor];
	if(!tempDict){
		tempDict = [NSMutableDictionary dictionary];
	}
	[tempDict setObject:maskColor forKey:[NSString stringWithFormat:@"%ld", state]];
	[_colorDict setObject:tempDict forKey:kMaskTextColor];
}

- (UIColor *)maskTextColorState:(UIControlState)state
{
	NSDictionary *tempDict = [_colorDict objectForKey:kMaskTextColor];
	UIColor *resultMaskColor = [tempDict objectForKey:[NSString stringWithFormat:@"%ld", state]];
	if(resultMaskColor){
		return resultMaskColor;
	}else{
		return (UIColor *)[tempDict objectForKey:[NSString stringWithFormat:@"%ld", UIControlStateNormal]];
	}
}

- (void)savebackgroundImage:(UIImage *)backgroundImage state:(UIControlState)state
{
    if(!backgroundImage){
        return;
    }
    NSMutableDictionary *tempDict = [_imageDict objectForKey:kBackgroundImage];
    if(!tempDict){
        tempDict = [NSMutableDictionary dictionary];
    }
    
    [tempDict setObject:backgroundImage forKey:[NSString stringWithFormat:@"%ld", state]];
    [_imageDict setObject:tempDict forKey:kBackgroundImage];
}

- (UIImage *)backgroundImageState:(UIControlState)state
{
    NSDictionary *tempDict = [_imageDict objectForKey:kBackgroundImage];
    UIImage *resultBackgroundImage = [tempDict objectForKey:[NSString stringWithFormat:@"%ld", state]];
    if(resultBackgroundImage){
        return resultBackgroundImage;
    }else{
        return (UIImage *)[tempDict objectForKey:[NSString stringWithFormat:@"%ld", UIControlStateNormal]];
    }


}

@end
