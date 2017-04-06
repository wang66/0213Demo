//
//  SecondViewController.m
//  0213Demo
//
//  Created by ZJCS on 17/2/16.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "SecondViewController.h"
#import "UIColor+Function.h"
#import "CoolButton.h"
#import "UIView+YWFrame.h"

@interface SecondViewController ()

@property (nonatomic, strong)UILabel		*contentLab;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self loadTitleView];
	[self loadContentView];
}

- (void)loadTitleView
{
	self.titleLabel.text = self.title;
}

- (void)loadContentView
{
	self.contentLab = [[UILabel alloc] initWithFrame:self.contentView.bounds];
	self.contentLab.textColor = [UIColor randomColor];
	self.contentLab.font = [UIFont boldSystemFontOfSize:18];
	self.contentLab.textAlignment = NSTextAlignmentCenter;
	self.contentLab.numberOfLines = 0;
	self.contentLab.text = self.title;
	[self.contentView addSubview:self.contentLab];
}

@end
