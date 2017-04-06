//
//  CommonBaseCell.h
//  0213Demo
//
//  Created by ZJCS on 17/2/16.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellDataAdapter.h"
#import "CommonViewController.h"


@interface CommonBaseCell : UITableViewCell

@property (nonatomic, strong)CellDataAdapter			*cellDataAdapter;
@property (nonatomic, strong)id							 data;
@property (nonatomic, strong)UITableView				*tableView;
@property (nonatomic, strong)NSIndexPath				*indexPath;
@property (nonatomic, strong)UIViewController			*viewController;

@property (nonatomic, assign)BOOL						 display;

#pragma mark - overWrite in subClass

- (void)setupCell;

- (void)loadSubView;

- (void)loadContent;

- (void)selectedEvent;

+ (CGFloat)cellHeight:(id)data;


#pragma mark - refrence adapter

- (void)setRefrenceWithCellDataAdapter:(CellDataAdapter *)adapter
								  data:(id)data
							 indexPath:(NSIndexPath *)indexPath
							 tableView:(UITableView *)tableView;

- (void)setRefrenceWithCellDataAdapter:(CellDataAdapter *)adapter
								  data:(id)data
							 indexPath:(NSIndexPath *)indexPath
							 tableView:(UITableView *)tableView
						viewController:(CommonViewController *)viewController;



@end
