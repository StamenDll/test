//
//  ManyMenuScrollView.m
//  TestCommen
//
//  Created by XKXX_Apple on 2018/1/31.
//  Copyright © 2018年 XKXX. All rights reserved.
//

#import "ManyMenuScrollView.h"

@implementation ManyMenuScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupMainView];
    }
    return self;
}

- (void)setupMainView{
    self.choiceColor=[UIColor greenColor];
    self.titleView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
    self.titleView.backgroundColor=[UIColor whiteColor];
    self.titleView.showsHorizontalScrollIndicator=NO;
    [self addSubview: self.titleView];
    
    self.titleSlider=[[UILabel alloc]initWithFrame:CGRectMake(0, self.titleView.frame.size.height-2,50,2)];
    self.titleSlider.backgroundColor=[UIColor orangeColor];
    [self.titleView addSubview:self.titleSlider];
    
    self.downView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, self.titleView.frame.origin.y+self.titleView.frame.size.height, self.frame.size.width, SCREENHEIGHT-(self.titleView.frame.origin.y+self.titleView.frame.size.height))];
    [self addSubview: self.downView];
}

- (void)addTitleView:(NSArray*)titleBtnArray{
    NSMutableArray *btnArray=[NSMutableArray new];
    for (int i=0; i<titleBtnArray.count; i++) {
        NSString *title=[titleBtnArray objectAtIndex:i];
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.tag=101+i;
        [button addTarget:self action:@selector(changeMenu:) forControlEvents:UIControlEventTouchUpInside];
        [self.titleView addSubview:button];
        
        UILabel *titleLabel=[UIControlClass addLabel:CGRectMake(10, 0, 0, button.frame.size.height) andText:title andFont:14 andColor:[UIColor blackColor] andAlignment:1 andTag:0];
        [titleLabel sizeToFit];
        [button addSubview:titleLabel];
        
        button.frame=CGRectMake(0, 0, titleLabel.frame.size.width+20, 40);
        titleLabel.center=CGPointMake(button.frame.size.width/2, button.frame.size.height/2);
        if (i==0) {
            button.selected=YES;
            lastMenuButton=button;
            titleLabel.textColor=self.choiceColor;
            if (_showSlider==NO) {
                self.titleSlider.frame=CGRectMake(0, self.titleSlider.frame.origin.y, button.frame.size.width,2);
            }
        }
        if (i>0) {
            UIButton *beforButton=[btnArray objectAtIndex:i-1];
            button.frame=CGRectMake(beforButton.frame.origin.x+beforButton.frame.size.width, button.frame.origin.y, button.frame.size.width, button.frame.size.height);
        }
        [btnArray addObject:button];
        self.titleView.contentSize=CGSizeMake(button.frame.origin.x+button.frame.size.width, 40);
    }
    
    UIButton *lastButton=[btnArray lastObject];
    if (lastButton.frame.origin.x+lastButton.frame.size.width<SCREENWIDTH-20) {
        for (int i=0; i<btnArray.count; i++) {
            UIButton *button=[btnArray objectAtIndex:i];
            button.frame=CGRectMake(SCREENWIDTH/btnArray.count*i, button.frame.origin.y,SCREENWIDTH/btnArray.count, button.frame.size.height);
            UILabel *label=[[button subviews] firstObject];
            label.center=CGPointMake(button.frame.size.width/2, button.frame.size.height/2);
            if (i==0&&self.showSlider==NO) {
                self.titleSlider.frame=CGRectMake(0, self.titleSlider.frame.origin.y, button.frame.size.width,2);
            }
        }
    }
    
    
    
}

- (void)changeMenu:(UIButton*)button{
    
}

- (void)setChoiceColor:(UIColor *)choiceColor{
    self.titleSlider.backgroundColor=choiceColor;
}

- (void)setShowSlider:(BOOL)showSlider{
    self.titleSlider.hidden=showSlider;
}


@end
