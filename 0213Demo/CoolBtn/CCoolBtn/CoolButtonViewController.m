//
//  CoolButtonViewController.m
//  0213Demo
//
//  Created by ZJCS on 17/2/17.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "CoolButtonViewController.h"
#import "CoolButton.h"
#import "UIColor+Function.h"
#import "UIView+YWFrame.h"
#import "CoolAnimation.h"
#import "LayerDemoViewController.h"




@interface CoolButtonViewController ()<CoolButtonAnimationDelegate>

@end

@implementation CoolButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self loadTitleView];
	[self loadContentView];
    
}

- (void)loadTitleView
{
	self.titleLabel.text = @"CoolButton";
	self.rightButton.image = Image(@"shopCar32");
    
    [self.titleLabel invalidateIntrinsicContentSize];
}

- (void)loadContentView
{
    
    self.contentView.backgroundColor = WhiteColor;
    

#pragma mark - ButtonEffectTypeNone
    
    UILabel *titleLab1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.contentView.yw_width, 50)];
    titleLab1.font = Font(15);
    titleLab1.textColor = LightGrayColor;
    titleLab1.text = @"1 | ButtonEffectTypeNone";
    [titleLab1 sizeToFit];
    [self.contentView addSubview:titleLab1];
    
	CoolButton *button1= [[CoolButton alloc] initWithFrame:CGRectMake(10,titleLab1.yw_bottom+5,80,35) buttonEffectType:ButtonEffectTypeNone];
	button1.target = self;
	button1.selector = @selector(buttonClick:);
    [button1 setText:@"收藏" forState:UIControlStateNormal];
    [button1 setText:@"已收藏" forState:UIControlStateSelected];
    [button1 setTextColor:LightTextColor forState:UIControlStateNormal];
    [button1 setTextColor:WhiteColor forState:UIControlStateSelected];
    [button1 setImage:Image(@"heart16_no") forState:UIControlStateNormal];
    [button1 setImage:Image(@"heart16_yes") forState:UIControlStateSelected];
	[button1 setBgColor:RandomColor forState:UIControlStateNormal];
	[button1 setBgColor:LightGrayColor forState:UIControlStateSelected];
//	button1.duration = 0.25f;
//	button1.scale = 0.8;
	button1.layer.cornerRadius = 3.f;
	button1.layer.masksToBounds = YES;
    button1.tag = 101;
	[self.contentView addSubview:button1];
    
    CoolButton *button11= [[CoolButton alloc] initWithFrame:CGRectMake(button1.yw_right+5.f,titleLab1.yw_bottom+5,30,35) buttonEffectType:ButtonEffectTypeNone];
    button11.target = self;
    button11.selector = @selector(buttonClick:);
    [button11 setImage:Image(@"heart16_no") forState:UIControlStateNormal];
    [button11 setImage:Image(@"heart16_yes") forState:UIControlStateSelected];
	[button11 setBgColor:RandomColor forState:UIControlStateNormal];
//    button11.duration = 0.25f;
//    button11.scale = 0.8;
    button11.layer.cornerRadius = 3.f;
    button11.layer.masksToBounds = YES;
    button11.tag = 1011;
    [self.contentView addSubview:button11];
    
	
    
    
    
#pragma mark - ButtonEffectTypeScale
    
    UILabel *titleLab2 = [[UILabel alloc] initWithFrame:CGRectMake(10, button11.yw_bottom+5.f, self.contentView.yw_width, 50)];
    titleLab2.font = Font(15);
    titleLab2.textColor = LightGrayColor;
    titleLab2.text = @"2 | ButtonEffectTypeScale";
    [titleLab2 sizeToFit];
    [self.contentView addSubview:titleLab2];
    
	CoolButton *button2 = [[CoolButton alloc] initWithFrame:CGRectMake(10, titleLab2.yw_bottom+5, 80, 35.f) buttonEffectType:ButtonEffectTypeScale];
	button2.target = self;
	button2.selector = @selector(buttonClick:);
    [button2 setText:@"收藏" forState:UIControlStateNormal];
    [button2 setText:@"已收藏" forState:UIControlStateSelected];
    [button2 setTextColor:WhiteColor forState:UIControlStateNormal];
    [button2 setTextColor:LightTextColor forState:UIControlStateSelected];
    [button2 setImage:Image(@"heart16_no") forState:UIControlStateNormal];
    [button2 setImage:Image(@"heart16_yes") forState:UIControlStateSelected];
	[button2 setBgColor:RandomColor forState:UIControlStateNormal];
	[button2 setBgColor:LightGrayColor forState:UIControlStateSelected];
	button2.duration = 0.2;
	button2.scale = 0.8;
	button2.layer.cornerRadius = 3.f;
	button2.layer.masksToBounds = YES;
    button2.tag = 102;
	[self.contentView addSubview:button2];
    
	
	
	
    CoolButton *button22 = [[CoolButton alloc] initWithFrame:CGRectMake(button2.yw_right+5.f,titleLab2.yw_bottom+5,80,35) buttonEffectType:ButtonEffectTypeScale];
    button22.target = self;
    button22.selector = @selector(buttonClick:);
    [button22 setImage:Image(@"heart24_no") forState:UIControlStateNormal];
    [button22 setImage:Image(@"heart24_yes") forState:UIControlStateSelected];
	[button22 setBgColor:RandomColor];
    button22.duration = 0.25f;
    button22.scale = 0.8;
    button22.layer.cornerRadius = 3.f;
    button22.layer.masksToBounds = YES;
    button22.tag = 1022;
    [self.contentView addSubview:button22];
    
    

    
    
    
    
#pragma mark - ButtonEffectTypeHeartBeat0
    
    UILabel *titleLab3 = [[UILabel alloc] initWithFrame:CGRectMake(10, button22.yw_bottom+5.f, self.contentView.yw_width, 50)];
    titleLab3.font = Font(15);
    titleLab3.textColor = LightGrayColor;
    titleLab3.text = @"3 | ButtonEffectTypeHeartBeat0";
    [titleLab3 sizeToFit];
    [self.contentView addSubview:titleLab3];

    
	CoolButton *button3 = [[CoolButton alloc] initWithFrame:CGRectMake(10, titleLab3.yw_bottom+5,80,35) buttonEffectType:ButtonEffectTypeHeartBeat0];
	button3.target = self;
	button3.selector = @selector(buttonClick:);
    [button3 setText:@"收藏" forState:UIControlStateNormal];
    [button3 setText:@"已收藏" forState:UIControlStateSelected];
    [button3 setTextColor:WhiteColor forState:UIControlStateNormal];
    [button3 setTextColor:LightTextColor forState:UIControlStateSelected];
    [button3 setImage:Image(@"heart16_no") forState:UIControlStateNormal];
    [button3 setImage:Image(@"heart16_yes") forState:UIControlStateSelected];
	[button3 setBgColor:RandomColor forState:UIControlStateNormal];
	[button3 setBgColor:LightGrayColor forState:UIControlStateSelected];
	button3.layer.cornerRadius = 3.f;
	button3.layer.masksToBounds = YES;
    button3.tag = 103;
	[self.contentView addSubview:button3];
	
    
    
    CoolButton *button33 = [[CoolButton alloc] initWithFrame:CGRectMake(button3.yw_right+5.f,titleLab3.yw_bottom+5,80,35) buttonEffectType:ButtonEffectTypeHeartBeat0];
    button33.target = self;
    button33.selector = @selector(buttonClick:);
    [button33 setImage:Image(@"heart24_no") forState:UIControlStateNormal];
    [button33 setImage:Image(@"heart24_yes") forState:UIControlStateSelected];
	[button33 setBgColor:RandomColor];
    button33.duration = 0.5f;
    button33.scale = 0.8;
    button33.layer.cornerRadius = 3.f;
    button33.layer.masksToBounds = YES;
    button33.tag = 1033;
    [self.contentView addSubview:button33];
    
    
    
    
    
    
    
#pragma mark - ButtonEffectTypeHeartBeat1
    
    UILabel *titleLab4 = [[UILabel alloc] initWithFrame:CGRectMake(10, button33.yw_bottom+5.f, self.contentView.yw_width, 50)];
    titleLab4.font = Font(15);
    titleLab4.textColor = LightGrayColor;
    titleLab4.text = @"4 | ButtonEffectTypeHeartBeat1";
    [titleLab4 sizeToFit];
    [self.contentView addSubview:titleLab4];
    
    
    CoolButton *button4 = [[CoolButton alloc] initWithFrame:CGRectMake(10, titleLab4.yw_bottom+5.f, 80, 35) buttonEffectType:ButtonEffectTypeHeartBeat1];
    button4.target = self;
    button4.selector = @selector(buttonClick:);
    [button4 setText:@"收藏" forState:UIControlStateNormal];
    [button4 setText:@"已收藏" forState:UIControlStateSelected];
    [button4 setTextColor:LightTextColor forState:UIControlStateNormal];
    [button4 setTextColor:WhiteColor forState:UIControlStateSelected];
    [button4 setImage:Image(@"heart16_no") forState:UIControlStateNormal];
    [button4 setImage:Image(@"heart16_yes") forState:UIControlStateSelected];
    [button4 setFont:Font(13) forState:UIControlStateNormal];
    [button4 setFont:Font(13) forState:UIControlStateSelected];
	[button4  setBgColor:RandomColor forState:UIControlStateNormal];
	[button4 setBgColor:LightGrayColor forState:UIControlStateSelected];
    button4.duration = 0.9f;
    button4.multipleScale = 2.f;
    button4.layer.cornerRadius = 3.f;
//    button4.maskContent = @"+1";
    button4.tag = 104;
    [self.contentView addSubview:button4];
    
    
    CoolButton *button44 = [[CoolButton alloc] initWithFrame:CGRectMake(button4.yw_right+5.f,titleLab4.yw_bottom+5,80,35) buttonEffectType:ButtonEffectTypeHeartBeat1];
    button44.target = self;
    button44.selector = @selector(buttonClick:);
    [button44 setImage:Image(@"heart24_no") forState:UIControlStateNormal];
    [button44 setImage:Image(@"heart24_yes") forState:UIControlStateSelected];
	[button44 setBgColor:RandomColor];
    button44.duration = 0.9f;
    button44.multipleScale = 2.f;
    button44.layer.cornerRadius = 3.f;
//    button44.layer.masksToBounds = YES;
    button44.tag = 1044;
    [self.contentView addSubview:button44];
	
    
    
    
    
    
#pragma mark - ButtonEffectTypeRise
    
    UILabel *titleLab5 = [[UILabel alloc] initWithFrame:CGRectMake(10, button44.yw_bottom+5.f, self.contentView.yw_width, 50)];
    titleLab5.font = Font(15);
    titleLab5.textColor = LightGrayColor;
    titleLab5.text = @"5 | ButtonEffectTypeRise";
    [titleLab5 sizeToFit];
    [self.contentView addSubview:titleLab5];
    
    
    CoolButton *button5 = [[CoolButton alloc] initWithFrame:CGRectMake(10, titleLab5.yw_bottom+5.f,80,35) buttonEffectType:ButtonEffectTypeRise];
    button5.target = self;
    button5.selector = @selector(buttonClick:);
    [button5 setText:@"收藏" forState:UIControlStateNormal];
    [button5 setText:@"已收藏" forState:UIControlStateSelected];
    [button5 setTextColor:LightTextColor forState:UIControlStateNormal];
    [button5 setTextColor:WhiteColor forState:UIControlStateSelected];
    [button5 setImage:Image(@"heart16_no") forState:UIControlStateNormal];
    [button5 setImage:Image(@"heart16_yes") forState:UIControlStateSelected];
    [button5 setFont:[UIFont systemFontOfSize:13] forState:UIControlStateNormal];
    [button5 setFont:[UIFont systemFontOfSize:13] forState:UIControlStateSelected];
	[button5 setBgColor:RandomColor forState:UIControlStateNormal];
	[button5 setBgColor:LightGrayColor forState:UIControlStateSelected];
	button5.maskTextColor = [UIColor orangeColor];
    button5.duration = 1.f;
    button5.multipleScale = 2.f;
    button5.scale = 0.5;
    button5.maskContent = @"+1";
    button5.layer.cornerRadius = 3.f;
    button5.tag = 105;
    [self.contentView addSubview:button5];
	
    
    
    CoolButton *button55 = [[CoolButton alloc] initWithFrame:CGRectMake(button5.yw_right+5.f,titleLab5.yw_bottom+5,80,35) buttonEffectType:ButtonEffectTypeRise];
    button55.target = self;
    button55.selector = @selector(buttonClick:);
    [button55 setImage:Image(@"heart24_no") forState:UIControlStateNormal];
    [button55 setImage:Image(@"heart24_yes") forState:UIControlStateSelected];
    [button55 setBgColor:RandomColor];
    button55.duration = 1.f;
    button55.multipleScale = 2.f;
    button55.scale = 0.5;
    button55.maskContent = @"+1";
    button55.layer.cornerRadius = 3.f;
    button55.tag = 1055;
    [self.contentView addSubview:button55];
	
	
	CoolButton *button555 = [[CoolButton alloc] initWithFrame:CGRectMake(button55.yw_right+5.f,titleLab5.yw_bottom+5,80,35) buttonEffectType:ButtonEffectTypeRise];
	button555.target = self;
	button555.selector = @selector(buttonClick:);
	[button555 setImage:Image(@"heart24_no") forState:UIControlStateNormal];
	[button555 setImage:Image(@"heart24_yes") forState:UIControlStateSelected];
	[button55 setBgColor:RandomColor];
	button555.duration = 1.f;
	button555.multipleScale = 2.f;
	button555.scale = 0.5;
	button555.maskContent = Image(@"heart24_yes");
	button555.layer.cornerRadius = 3.f;
	button555.tag = 10555;
	[self.contentView addSubview:button555];
	
	
	
	
#pragma mark - ButtonEffectTypeLoad
    
    UILabel *titleLab6 = [[UILabel alloc] initWithFrame:CGRectMake(10, button55.yw_bottom+5.f, self.contentView.yw_width, 50)];
    titleLab6.font = Font(15);
    titleLab6.textColor = LightGrayColor;
    titleLab6.text = @"6 | ButtonEffectTypeLoad";
    [titleLab6 sizeToFit];
    [self.contentView addSubview:titleLab6];
    
    
    CoolButton *button6 = [[CoolButton alloc] initWithFrame:CGRectMake(10, titleLab6.yw_bottom+5.f,80,35) buttonEffectType:ButtonEffectTypeLoad];
    button6.target = self;
    button6.selector = @selector(buttonClick:);
    [button6 setText:@"128" forState:UIControlStateNormal];
    [button6 setText:@"129" forState:UIControlStateSelected];
    [button6 setTextColor:LightTextColor forState:UIControlStateNormal];
    [button6 setTextColor:WhiteColor forState:UIControlStateSelected];
    [button6 setImage:Image(@"heart16_no") forState:UIControlStateNormal];
    [button6 setImage:Image(@"heart16_yes") forState:UIControlStateSelected];
    [button6 setFont:Font(13) forState:UIControlStateNormal];
    [button6 setFont:Font(13) forState:UIControlStateSelected];
	[button6 setBgColor:RandomColor forState:UIControlStateNormal];
	[button6 setBgColor:LightGrayColor forState:UIControlStateSelected];
//    button6.duration = 0.6f;
//    button6.scale = 0.9;
    button6.layer.cornerRadius = 3.f;
    button6.layer.masksToBounds = YES;
    button6.tag = 106;
    [self.contentView addSubview:button6];
    
    
    CoolButton *button66 = [[CoolButton alloc] initWithFrame:CGRectMake(button6.yw_right+5.f,titleLab6.yw_bottom+5,80,35) buttonEffectType:ButtonEffectTypeLoad];
    button66.target = self;
    button66.selector = @selector(buttonClick:);
    [button66 setImage:Image(@"heart24_no") forState:UIControlStateNormal];
    [button66 setImage:Image(@"heart24_yes") forState:UIControlStateSelected];
	[button66 setBgColor:RandomColor];
    button66.duration = 0.9f;
    button66.multipleScale = 2.f;
    button66.layer.cornerRadius = 3.f;
    button66.layer.masksToBounds = YES;
    button66.tag = 1066;
    [self.contentView addSubview:button66];
	
	
	CoolButton *button666 = [[CoolButton alloc] initWithFrame:CGRectMake(button66.yw_right+5.f,titleLab6.yw_bottom+5,80,35) buttonEffectType:ButtonEffectTypeLoad1];
	button666.target = self;
	button666.selector = @selector(buttonClick:);
	[button666 setText:@"128" forState:UIControlStateNormal];
	[button666 setText:@"129" forState:UIControlStateSelected];
	[button666 setTextColor:LightTextColor forState:UIControlStateNormal];
	[button666 setTextColor:WhiteColor forState:UIControlStateSelected];
	[button666 setImage:Image(@"heart16_no") forState:UIControlStateNormal];
	[button666 setImage:Image(@"heart16_yes") forState:UIControlStateSelected];
	[button666 setFont:Font(13) forState:UIControlStateNormal];
	[button666 setFont:Font(13) forState:UIControlStateSelected];
	[button666 setBgColor:RandomColor];
	button666.maskContent = @"加载中...";
	button666.maskTextColor = [UIColor purpleColor];
	button666.duration = 0.9f;
//	button666.multipleScale = 2.f;
	button666.layer.cornerRadius = 3.f;
	button666.layer.masksToBounds = YES;
	button666.tag = 10666;
	[self.contentView addSubview:button666];
	
	
	
	
#pragma mark - ButtonEffectTypeThrow
    
    UILabel *titleLab7 = [[UILabel alloc] initWithFrame:CGRectMake(10, button66.yw_bottom+5.f, self.contentView.yw_width, 50)];
    titleLab7.font = Font(15);
    titleLab7.textColor = LightGrayColor;
    titleLab7.text = @"7 | ButtonEffectTypeThrow";
    [titleLab7 sizeToFit];
    [self.contentView addSubview:titleLab7];
	
    CoolButton *button7 = [[CoolButton alloc] initWithFrame:CGRectMake(10, titleLab7.yw_bottom+5,80,35) buttonEffectType:ButtonEffectTypeThrow];
    button7.target = self;
    button7.selector = @selector(buttonClick:);
    [button7 setText:@"买买买" forState:UIControlStateNormal];
    [button7 setText:@"买买买" forState:UIControlStateSelected];
    [button7 setTextColor:LightTextColor forState:UIControlStateNormal];
    [button7 setTextColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [button7 setImage:Image(@"heart16_no") forState:UIControlStateNormal];
    [button7 setImage:Image(@"heart16_yes") forState:UIControlStateSelected];
    [button7 setFont:Font(13) forState:UIControlStateNormal];
    [button7 setFont:Font(13) forState:UIControlStateSelected];
	[button7 setBgColor:RandomColor forState:UIControlStateNormal];
	[button7 setBgColor:LightGrayColor forState:UIControlStateSelected];
    button7.buttonAnimationDelegate = self;
    button7.duration = 0.8f;
    button7.maskContent = Image(@"heart16_yes");
    button7.layer.cornerRadius = 3.f;
//    button7.layer.masksToBounds = YES;
    button7.tag = 107;
    [self.contentView addSubview:button7];
    

	
	
	
    
    
#pragma mark -  ButtonEffectTypeRipple
    
    UILabel *titleLab8 = [[UILabel alloc] initWithFrame:CGRectMake(10, button7.yw_bottom+5.f, self.contentView.yw_width, 50)];
    titleLab8.font = Font(15);
    titleLab8.textColor = LightGrayColor;
    titleLab8.text = @"8 | ButtonEffectTypeRipple";
    [titleLab8 sizeToFit];
    [self.contentView addSubview:titleLab8];
    
    
    CoolButton *button8 = [[CoolButton alloc] initWithFrame:CGRectMake(titleLab8.yw_right+5, button7.yw_bottom+5, 160, 40) buttonEffectType:ButtonEffectTypeRipple];
    button8.target = self;
    button8.selector = @selector(buttonClick:);
    [button8 setText:@"128" forState:UIControlStateNormal];
    [button8 setText:@"129" forState:UIControlStateSelected];
    [button8 setTextColor:LightTextColor forState:UIControlStateNormal];
    [button8 setTextColor:WhiteColor forState:UIControlStateSelected];
    [button8 setImage:Image(@"heart16_no") forState:UIControlStateNormal];
    [button8 setImage:Image(@"heart16_yes") forState:UIControlStateSelected];
    [button8 setFont:Font(13) forState:UIControlStateNormal];
    [button8 setFont:Font(13) forState:UIControlStateSelected];
	[button8  setBgColor:RandomColor forState:UIControlStateNormal];
	[button8 setBgColor:LightGrayColor forState:UIControlStateSelected];
	button8.duration = 1.2f;
    //    button6.scale = 0.9;
    button8.layer.cornerRadius = 3.f;
//    button8.layer.masksToBounds = YES;
    button8.tag = 108;
    [self.contentView addSubview:button8];
	
	
    
    
    
#pragma mark - ButtonEffectTypeProgress
    
    UILabel *titleLab9 = [[UILabel alloc] initWithFrame:CGRectMake(10, button8.yw_bottom+5, self.contentView.yw_width, 50)];
    titleLab9.font = Font(15);
    titleLab9.textColor = LightGrayColor;
    titleLab9.text = @"9 | ButtonEffectTypeProgress";
    [titleLab9 sizeToFit];
    [self.contentView addSubview:titleLab9];
    
    
	CoolButton *button9 = [[CoolButton alloc] initWithFrame:CGRectMake(titleLab9.yw_right+5, titleLab9.yw_top+5, 160, 40) buttonEffectType:ButtonEffectTypeProgress];
	button9.target = self;
	button9.selector = @selector(buttonClick:);
	[button9 setText:@"128" forState:UIControlStateNormal];
	[button9 setText:@"129" forState:UIControlStateSelected];
	[button9 setTextColor:LightTextColor forState:UIControlStateNormal];
	[button9 setTextColor:WhiteColor forState:UIControlStateSelected];
	[button9 setImage:Image(@"heart16_no") forState:UIControlStateNormal];
	[button9 setImage:Image(@"heart16_yes") forState:UIControlStateSelected];
	[button9 setFont:Font(13) forState:UIControlStateNormal];
	[button9 setFont:Font(13) forState:UIControlStateSelected];
	[button9  setBgColor:RandomColor forState:UIControlStateNormal];
	[button9 setBgColor:LightGrayColor forState:UIControlStateSelected];
	button9.duration = 0.6f;
	//    button6.scale = 0.9;
	button9.layer.cornerRadius = 3.f;
	//    button8.layer.masksToBounds = YES;
	button9.tag = 109;
	[self.contentView addSubview:button9];
	
	
	
#pragma mark - ButtonEffectTypeMark
    UILabel *titleLab10 = [[UILabel alloc] initWithFrame:CGRectMake(10, button9.yw_bottom+5, self.contentView.yw_width, 50)];
    titleLab10.font = Font(15);
    titleLab10.textColor = LightGrayColor;
    titleLab10.text = @"10 | ButtonEffectTypeMark";
    [titleLab10 sizeToFit];
    [self.contentView addSubview:titleLab10];
	
	
	CoolButton *button10 = [[CoolButton alloc] initWithFrame:CGRectMake(titleLab10.yw_right+5, titleLab10.yw_top, 160, 40) buttonEffectType:ButtonEffectTypeMark];
	button10.target = self;
	button10.selector = @selector(buttonClick:);
	[button10 setText:@"128" forState:UIControlStateNormal];
	[button10 setText:@"129" forState:UIControlStateSelected];
	[button10 setTextColor:LightTextColor forState:UIControlStateNormal];
	[button10 setTextColor:WhiteColor forState:UIControlStateSelected];
	[button10 setImage:Image(@"heart16_no") forState:UIControlStateNormal];
	[button10 setImage:Image(@"heart16_yes") forState:UIControlStateSelected];
	[button10 setFont:Font(13) forState:UIControlStateNormal];
	[button10 setFont:Font(13) forState:UIControlStateSelected];
	[button10 setBgColor:RandomColor forState:UIControlStateNormal];
	[button10 setBgColor:LightGrayColor forState:UIControlStateSelected];
	button10.duration = 0.6f;
	//    button6.scale = 0.9;
	button10.layer.cornerRadius = 3.f;
	//    button8.layer.masksToBounds = YES;
	button10.tag = 1010;
	[self.contentView addSubview:button10];
}

- (void)buttonClick:(CoolButton *)btn
{
    switch (btn.tag)
    {
        case 101:
        {
            btn.selected = !btn.selected;
        }
            break;
        case 1011:
        {
            btn.selected = !btn.selected;
        }
            break;
            
        case 102:
        {
            btn.selected = !btn.selected;
        }
            break;
            
        case 1022:
        {
            btn.selected = !btn.selected;
        }
            break;

        case 103:
        {
            btn.selected = !btn.selected;
        }
            break;
            
        case 1033:
        {
            btn.selected = !btn.selected;
        }
            break;

        case 104:
        {
            btn.selected = !btn.selected;
        }
            break;
            
        case 1044:
        {
            btn.selected = !btn.selected;
        }
            break;

        case 105:
        {
            btn.selected = !btn.selected;
        }
            break;
            
        case 1055:
        {
            btn.selected = !btn.selected;
        }
            break;
			
		case 10555:
		{
			btn.selected = !btn.selected;
		}
			break;

        case 106:
        {
//             btn.selected = !btn.selected;
            if(!btn.selected){
                [btn beginLoad];
                [self loadFinshed:btn];
            }else{
                [self changeSelected:btn];
            }
        }
            break;
            
        case 1066:
        {
//            btn.selected = !btn.selected;
            if(!btn.selected){
                [btn beginLoad];
                [self loadFinshed:btn];
            }else{
                [self changeSelected:btn];
            }
        }
            break;
			
		case 10666:
		{
			//            btn.selected = !btn.selected;
			if(!btn.selected){
				[btn beginLoad];
				[self loadFinshed:btn];
			}else{
				[self changeSelected:btn];
			}
		}
			break;
			
        case 107:
        {
			btn.selected = !btn.selected;
            
        }
            break;
			
            
        case 108:
        {
            btn.selected = !btn.selected;
        }
            break;
            
        case 1088:
        {
            btn.selected = !btn.selected;
        }
            break;
			
		case 109:
		{
			btn.selected = !btn.selected;
		}
			break;

        default:
            break;
    }
    
}

- (void)loadFinshed:(CoolButton *)button
{
    if(!button.selected){
        [self performSelector:@selector(endLoadHandle:) withObject:button afterDelay:3.f];
    }else{
        [self changeSelected:button];
    }
}

- (void)changeSelected:(CoolButton *)button{
    button.selected = !button.selected;
    
}

- (void)endLoadHandle:(CoolButton *)button
{
    [self changeSelected:button];
    [button endLoad];
}


#pragma mark - CoolButtonAnimationDelegate

- (void)coolButtonDidStart:(CoolButton *)button animation:(CAAnimation *)animation
{
    
}

- (void)coolButtonDidStop:(CoolButton *)button animation:(CAAnimation *)animation
{
    if(button.tag == 107){
        //
        CGPoint rightBtnPosition = CGPointMake(self.rightButton.layer.position.x, self.rightButton.layer.position.y);
        CAKeyframeAnimation *keyframeAnimation = [CoolAnimation keyframeAnimationWithKeyPath:@"position"
                                                                                      values:@[ValuePoint(rightBtnPosition),
                                                                                               ValuePoint(CGPointMake(rightBtnPosition.x, rightBtnPosition.y+2.f)),
                                                                                               ValuePoint(CGPointMake(rightBtnPosition.x, rightBtnPosition.y-2.f)),
                                                                                               ValuePoint(rightBtnPosition)]
                                                                                    keyTimes:nil
                                                                                    duration:0.5];
        [self.rightButton.layer addAnimation:keyframeAnimation forKey:nil];
    }
}


- (void)rightButtonClick
{
    LayerDemoViewController *layerDemoVC = [LayerDemoViewController new];
    [self.navigationController pushViewController:layerDemoVC animated:YES];
}





@end
