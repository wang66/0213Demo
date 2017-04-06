//
//  UITableView+CellClass.h
//  0213Demo
//
//  Created by ZJCS on 17/2/13.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonBaseCell.h"

@interface CellClassType : NSObject

@property (nonatomic, copy)NSString			*reuseIdentifier;
@property (nonatomic, copy)NSString			*classString;

+ (instancetype)cellClassTypeWithClassString:(NSString *)classString;
+ (instancetype)cellClassTypeWithClassString:(NSString *)classString reuseIdentifier:(NSString *)reuseIdentifier;

@end

NS_INLINE CellClassType *cellClassType(NSString *classString, NSString *reuseIdentifier)
{
	return [CellClassType cellClassTypeWithClassString:classString reuseIdentifier:reuseIdentifier];
}


@interface UITableView (CellClass)

@property (nonatomic, strong) CommonViewController *viewController;



- (void)registerCellsClass:(NSArray<CellClassType *> *)cellsClass;

- (CommonBaseCell *)dequeueCellAndLoadContentFromAdapter:(CellDataAdapter *)adapter
										indexPath:(NSIndexPath *)indexPath;

- (CommonBaseCell *)dequeueCellAndLoadContentFromAdapter:(CellDataAdapter *)adapter
										indexPath:(NSIndexPath *)indexPath
									   controller:(CommonViewController *)controller;
@end
