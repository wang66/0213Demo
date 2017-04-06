//
//  CellDataAdapter.m
//  0213Demo
//
//  Created by ZJCS on 17/2/16.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "CellDataAdapter.h"

@implementation CellDataAdapter

+ (CellDataAdapter *)cellDataAdapterWithReuseIdentifier:(NSString *)identifier
												 data:(id)data
{
	CellDataAdapter *adapter = [[self class] new];
	adapter.cellReuseIdentifier = identifier;
	adapter.data = data;
	
	return adapter;
}

@end
