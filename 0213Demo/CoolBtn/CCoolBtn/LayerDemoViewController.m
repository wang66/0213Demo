//
//  LayerDemoViewController.m
//  0213Demo
//
//  Created by 王亚文 on 2017/2/25.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "LayerDemoViewController.h"
#import "UIView+YWFrame.h"
#import "UIColor+Function.h"


@interface LayerDemoViewController ()<CALayerDelegate>

@property (nonatomic, strong)CALayer        *customLayer;

@property (nonatomic, strong)UIView         *demoView;

@end

@implementation LayerDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _customLayer = [CALayer layer];
    _customLayer.position = self.contentView.center;
    _customLayer.bounds = CGRectMake(0, 0, 100, 100);
    _customLayer.backgroundColor = [UIColor blueColor].CGColor;
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromBottom;
    _customLayer.actions = @{@"backgroundColor":transition};
    [self.contentView.layer addSublayer:_customLayer];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    btn.center = CGPointMake(self.contentView.center.x, self.contentView.center.y+150);
    btn.bounds = CGRectMake(0, 0, 100, 35);
    [btn setTitle:@"改变背景色" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn];
    
}


- (void)btnClick:(UIButton *)btn{
    _customLayer.backgroundColor = RandomColor.CGColor;
}












@end
