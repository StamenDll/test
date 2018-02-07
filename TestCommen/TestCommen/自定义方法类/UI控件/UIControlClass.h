//
//  UIControlClass.h
//  TestCommen
//
//  Created by XKXX_Apple on 2018/1/31.
//  Copyright © 2018年 XKXX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControlClass : UIView

/**
 创建简单图片视图

 @param frame 坐标
 @param imageName 图片名称
 @return 图片视图
 */
+ (UIImageView*)addImageView:(CGRect)frame andName:(NSString*)imageName;


/**
 创建无名称简单图片视图

 @param frame 坐标
 @param imageName 图片名称
 @param bgView 背景视图
 */
+ (void)addImageView:(CGRect)frame andName:(NSString*)imageName andBGView:(UIView*)bgView;

/**
 创建简单局部UILabel
 
 @param frame 位置信息
 @param text 文本内容
 @param font 文字大小
 @param color 文字颜色
 @param alignment 显示方式
 @param tag 标签值
 @param bgView 父视图
 */
+ (void)addLabel:(CGRect)frame andText:(NSString*)text andFont:(CGFloat)font andColor:(UIColor*)color andAlignment:(NSInteger)alignment andTag:(int)tag andBGView:(UIView*)bgView;

/**
 创建简单局部UILabel
 
 @param frame 位置信息
 @param text 文本内容
 @param font 文字大小
 @param color 文字颜色
 @param alignment 显示方式
 @param tag 标签值
 */
+ (UILabel*)addLabel:(CGRect)frame andText:(NSString*)text andFont:(CGFloat)font andColor:(UIColor*)color andAlignment:(NSInteger)alignment andTag:(int)tag;


/**
 创建简单的文字按钮

 @param frame 坐标
 @param color 背景色
 @param tag 标签值
 @param text 文字
 @param font 文字大小
 @param textColor 文字颜色
 @param alignment 文字位置
 @return 按钮
 */
+ (UIButton*)addButton:(CGRect)frame adnColor:(UIColor*)color andTag:(NSInteger)tag andText:(NSString*)text andFont:(CGFloat)font andColor:(UIColor*)textColor andAlignment:(NSInteger)alignment;



/**
 创建简单单色线条

 @param frame 坐标
 @param color 颜色
 @param backView 父视图
 */
+ (void)addLineLabel:(CGRect)frame andColor:(UIColor*)color andBackView:(UIView*)backView;




















@end
