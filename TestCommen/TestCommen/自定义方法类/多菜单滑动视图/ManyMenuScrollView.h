//
//  ManyMenuScrollView.h
//  TestCommen
//
//  Created by XKXX_Apple on 2018/1/31.
//  Copyright © 2018年 XKXX. All rights reserved.
//

#import "UIControlClass.h"

@interface ManyMenuScrollView : UIControlClass
{
    UIButton *lastMenuButton;
}
@property(nonatomic,strong)UIScrollView *titleView;
@property(nonatomic,strong)UIScrollView *downView;
@property(nonatomic,strong)UILabel *titleSlider;
@property(nonatomic,strong)UIColor *choiceColor;
@property(nonatomic,assign)BOOL showSlider;

- (void)addTitleView:(NSArray*)titleBtnArray;
@end
