//
//  RowModel.h
//  0213Demo
//
//  Created by ZJCS on 17/2/13.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RowModel : NSObject

@property (nonatomic, copy)NSString		*title;
@property (nonatomic, strong)id			 nextVC;

+ (RowModel *)rowModelWithTitle:(NSString *)title;

+ (RowModel *)rowModelWithTitle:(NSString *)title nextVC:(id)nextVC;

@end
