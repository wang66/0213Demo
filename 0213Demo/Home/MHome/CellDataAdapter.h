//
//  CellDataAdapter.h
//  0213Demo
//
//  Created by ZJCS on 17/2/16.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface CellDataAdapter : NSObject

@property (nonatomic, copy)NSString			*cellReuseIdentifier;
@property (nonatomic, strong)id				 data;
@property (nonatomic, strong)UITableView	*tableView;

+ (CellDataAdapter *)cellDataAdapterWithReuseIdentifier:(NSString *)identifier
												 data:(id)data;

@end
