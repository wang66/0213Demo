//
//  CommonBaseCell.m
//  0213Demo
//
//  Created by ZJCS on 17/2/16.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "CommonBaseCell.h"

@implementation CommonBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
	{
		[self setupCell];
		[self loadSubView];
	}
	
	return self;
}

#pragma mark - overWrite in subClass

- (void)setupCell
{
	
}

- (void)loadSubView
{
	
}

- (void)loadContent
{
	
}

- (void)selectedEvent
{
	
}

+ (CGFloat)cellHeight:(id)data
{
	return 0.f;
}



#pragma mark - refrence adapter

- (void)setRefrenceWithCellDataAdapter:(CellDataAdapter *)adapter
								  data:(id)data
							 indexPath:(NSIndexPath *)indexPath
							 tableView:(UITableView *)tableView
{
	_cellDataAdapter = adapter;
	_data = data;
	_indexPath = indexPath;
	_tableView = tableView;
}

- (void)setRefrenceWithCellDataAdapter:(CellDataAdapter *)adapter
								  data:(id)data
							 indexPath:(NSIndexPath *)indexPath
							 tableView:(UITableView *)tableView
						viewController:(CommonViewController *)viewController
{
	_cellDataAdapter = adapter;
	_data = data;
	_indexPath = indexPath;
	_tableView = tableView;
	_viewController = viewController;
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
