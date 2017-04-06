//
//  ListItemCell.m
//  0213Demo
//
//  Created by ZJCS on 17/2/16.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "ListItemCell.h"
#import "RowModel.h"
#import "UIColor+Function.h"

@interface ListItemCell ()
@property (nonatomic, strong)UIView				*bgView;
@property (nonatomic, strong)UILabel			*titleLab;
@end

@implementation ListItemCell

- (void)setupCell
{
	[super setupCell];
	
	self.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
	self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)loadSubView
{
	self.backgroundColor = [UIColor randomColor];
	self.bgView = [[UIView alloc] initWithFrame:self.bounds];
	[self addSubview:self.bgView];
	
	self.titleLab = [[UILabel alloc] initWithFrame:self.bounds];
	self.titleLab.font = [UIFont systemFontOfSize:13];
	self.titleLab.textColor = [UIColor grayColor];
	self.titleLab.numberOfLines = 0;
	[self.bgView addSubview:self.titleLab];
}

- (void)loadContent
{
	if(self.cellDataAdapter.data){
		RowModel *rowModel = (RowModel *)self.cellDataAdapter.data;
		self.titleLab.text = rowModel.title;
	}
}

+ (CGFloat)cellHeight:(id)data
{
	if([data isKindOfClass:[RowModel class]]){
	}
	return 60.f;
}

- (void)selectedEvent
{
	RowModel *rowModel = (RowModel *)self.cellDataAdapter.data;
	CommonViewController *nextVC = [rowModel.nextVC new];
	nextVC.title = rowModel.title;
	[self.viewController.navigationController pushViewController:nextVC animated:YES];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
	[super setHighlighted:highlighted animated:animated];
	if(!highlighted){
		CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
		anim.duration = 0.2f;
		anim.fromValue = @1.1;
		anim.toValue = @1;
		[self.titleLab.layer addAnimation:anim forKey:nil];
	}

}



@end
