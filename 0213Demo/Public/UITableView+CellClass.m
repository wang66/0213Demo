//
//  UITableView+CellClass.m
//  0213Demo
//
//  Created by ZJCS on 17/2/13.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "UITableView+CellClass.h"
#import <objc/runtime.h>

static NSString *const kViewController = @"kViewController";

@implementation CellClassType

+ (instancetype)cellClassTypeWithClassString:(NSString *)classString
{
	return [CellClassType cellClassTypeWithClassString:classString reuseIdentifier:classString];
}

+ (instancetype)cellClassTypeWithClassString:(NSString *)classString reuseIdentifier:(NSString *)reuseIdentifier
{
	CellClassType *type = [[[self class] alloc] init];
	type.reuseIdentifier = reuseIdentifier;
	type.classString = classString;
	return type;
}

@end




@implementation UITableView (CellClass)

- (void)registerCellsClass:(NSArray<CellClassType *> *)cellsClass
{
	for (int i=0; i<cellsClass.count; i++) {
		CellClassType *type = cellsClass[i];
		[self registerClass:NSClassFromString(type.classString) forCellReuseIdentifier:type.reuseIdentifier];
	}
}

- (CommonBaseCell *)dequeueCellAndLoadContentFromAdapter:(CellDataAdapter *)adapter
{
	return [self dequeueCellAndLoadContentFromAdapter:adapter indexPath:nil controller:nil];;
}

- (CommonBaseCell *)dequeueCellAndLoadContentFromAdapter:(CellDataAdapter *)adapter
											   indexPath:(NSIndexPath *)indexPath
{
	return [self dequeueCellAndLoadContentFromAdapter:adapter indexPath:indexPath controller:nil];
}

- (CommonBaseCell *)dequeueCellAndLoadContentFromAdapter:(CellDataAdapter *)adapter
											   indexPath:(NSIndexPath *)indexPath
											  controller:(CommonViewController *)controller
{
	CommonBaseCell *cell = [self dequeueReusableCellWithIdentifier:adapter.cellReuseIdentifier];
	CommonViewController *vc = controller==nil?self.viewController:controller;
	[cell setRefrenceWithCellDataAdapter:adapter data:adapter.data indexPath:indexPath tableView:self viewController:vc];
	[cell loadContent];
	
	return cell;
}

#pragma mark - Property Methods

- (CommonViewController *)viewController
{
	return objc_getAssociatedObject(self, &kViewController);
}

- (void)setViewController:(CommonViewController *)viewController
{
	objc_setAssociatedObject(self, &kViewController, viewController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
