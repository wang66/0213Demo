//
//  RowModel.m
//  0213Demo
//
//  Created by ZJCS on 17/2/13.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "RowModel.h"

@implementation RowModel

+ (RowModel *)rowModelWithTitle:(NSString *)title
{
	RowModel *model = [[[self class] alloc] init];
	model.title = title;
	
	return model;
}

+ (RowModel *)rowModelWithTitle:(NSString *)title nextVC:(id)nextVC
{
	RowModel *model = [[[self class] alloc] init];
	model.title = title;
	model.nextVC = nextVC;
	
	return model;
}
@end
