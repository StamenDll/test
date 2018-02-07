//
//  UIControlClass.m
//  TestCommen
//
//  Created by XKXX_Apple on 2018/1/31.
//  Copyright © 2018年 XKXX. All rights reserved.
//

#import "UIControlClass.h"

@implementation UIControlClass

#pragma mark 创建简单UIImageView
+ (UIImageView*)addImageView:(CGRect)frame andName:(NSString*)imageName{
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:frame];
    imageView.image=[UIImage imageNamed:imageName];
    return imageView;
}

+ (void)addImageView:(CGRect)frame andName:(NSString*)imageName andBGView:(UIView*)bgView{
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:frame];
    imageView.image=[UIImage imageNamed:imageName];
    imageView.backgroundColor=[UIColor grayColor];
    [bgView addSubview:imageView];
}

#pragma mark 创建简单无名称UIlabel
+ (void)addLabel:(CGRect)frame andText:(NSString*)text andFont:(CGFloat)font andColor:(UIColor*)color andAlignment:(NSInteger)alignment andTag:(int)tag andBGView:(UIView*)bgView{
    UILabel *label=[[UILabel alloc]initWithFrame:frame];
    label.text=text;
    label.font=[UIFont systemFontOfSize:font];
    label.textColor=color;
    label.textAlignment=alignment;
    label.tag=tag;
    [bgView addSubview:label];
}

#pragma mark 创建简单UIlabel
+ (UILabel*)addLabel:(CGRect)frame andText:(NSString*)text andFont:(CGFloat)font andColor:(UIColor*)color andAlignment:(NSInteger)alignment andTag:(int)tag{
    UILabel *label=[[UILabel alloc]initWithFrame:frame];
    label.text=text;
    label.font=[UIFont systemFontOfSize:font];
    label.textColor=color;
    label.textAlignment=alignment;
    label.tag=tag;
    return label;
}

#pragma mark 创建简单文字按钮
+ (UIButton*)addButton:(CGRect)frame adnColor:(UIColor*)color andTag:(NSInteger)tag andText:(NSString*)text andFont:(CGFloat)font andColor:(UIColor*)textColor andAlignment:(NSInteger)alignment{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=frame;
    button.backgroundColor=color;
    button.tag=tag;
    [UIControlClass addLabel:CGRectMake(0, 0, button.frame.size.width, button.frame.size.height) andText:text andFont:font andColor:textColor andAlignment:alignment andTag:0 andBGView:button];
    return button;
}

#pragma mark 简单单色线条
+ (void)addLineLabel:(CGRect)frame andColor:(UIColor*)color andBackView:(UIView*)backView{
    UILabel *lineLabel=[[UILabel alloc]initWithFrame:frame];
    lineLabel.backgroundColor=color;
    [backView addSubview:lineLabel];
}

@end
