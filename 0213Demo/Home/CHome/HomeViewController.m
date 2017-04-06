//
//  HomeViewController.m
//  0213Demo
//
//  Created by ZJCS on 17/2/13.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "HomeViewController.h"
#import "RowModel.h"
#import "UITableView+CellClass.h"
#import "CellDataAdapter.h"
#import "ListItemCell.h"
#import "SecondViewController.h"
#import "CoolButtonViewController.h"


@interface HomeViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)UITableView			*tableView;
@property (nonatomic, strong)NSMutableArray			*tableViewData;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self initData];
	[self loadTitleView];
	[self loadTableView];
}

- (void)loadTitleView
{
	self.titleLabel.text = @"佳句赏析";
	self.leftButton.hidden = YES;
}

- (void)initData
{
	
	self.tableViewData = [NSMutableArray array];
	NSArray *texts = @[@"醉后不知天在水， 满船清梦压星河。",
					   @"青青子衿，悠悠我心。但为君故，沉吟至今。",
					   @"梦里不知身是客，一晌贪欢。",
					   @"未来蓄尽闲言语，及至相逢半句无。",
					   @"桃李春风一杯酒，江湖夜雨十年灯。",
					   @"最是人间留不住，朱颜辞镜花辞树",
					   @"苟利国家生死以，岂因祸福避趋之。",
					   @"醉卧沙场君莫笑，古来征战几人回",
					   @"江汉水之大，鹄身鸟之微。更无相逢日，安可相随飞。",
					   @"金风玉露一相逢，便胜却人间无数",
					   @"孤舟蓑笠翁，独钓寒江雪。",
					   @"佳期不可再， 风雨杳如年。",
					   @"一朝负气成今日，四海无人对夕阳",
					   @"曾经沧海难为水，除却巫山不是云。",
					   @"庭有琵琶树，吾妻死之年所手植也，今已亭亭如盖矣",
					   @"陪君醉笑三千场，不诉离殇。"
					   ];
	
	for(int i=0; i<texts.count; i++)
	{
		RowModel *rowModel = [RowModel rowModelWithTitle:texts[i] nextVC:[SecondViewController class]];
		[self.tableViewData addObject:[CellDataAdapter cellDataAdapterWithReuseIdentifier:@"listCellId" data:rowModel]];
	}
}

- (void)loadTableView {
	
	self.tableView = [[UITableView alloc] initWithFrame:self.contentView.bounds style:UITableViewStylePlain];
	self.tableView.dataSource = self;
	self.tableView.delegate = self;
	self.tableView.rowHeight = 50.f;
	self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	self.tableView.viewController = self;
	[self.tableView registerCellsClass:@[cellClassType(@"ListItemCell", @"listCellId")]];
	[self.contentView addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.tableViewData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	CellDataAdapter *adapter = _tableViewData[indexPath.row];
	return [ListItemCell cellHeight:adapter.data];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//	return [tableView dequeueCellAndLoadContentFromAdapter:_tableViewData[indexPath.row] indexPath:indexPath controller:self];
	return [tableView dequeueCellAndLoadContentFromAdapter:_tableViewData[indexPath.row] indexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	[(ListItemCell *)[tableView cellForRowAtIndexPath:indexPath] selectedEvent];
}

- (void)rightButtonClick
{
	CoolButtonViewController *coolBtnVC = [CoolButtonViewController new];
	[self.navigationController pushViewController:coolBtnVC animated:YES];
}




@end
