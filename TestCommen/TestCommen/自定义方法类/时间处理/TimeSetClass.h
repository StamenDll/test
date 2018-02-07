//
//  TimeSetClass.h
//  TestCommen
//
//  Created by XKXX_Apple on 2018/1/31.
//  Copyright © 2018年 XKXX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeSetClass : NSObject

///截取目标时间格式

typedef enum
{
    //以下是枚举成员
    TimeYMD=0,
    TimeYM=1,
    TestMD=2,
    TimeHMS=3,
    TimeHM=4,
}TimeFormat;//枚举名称

/**
 获取当前时间
 
 @return 当前时间
 */
+ (NSString*)timeNow;


/**
 获取当前时间后的第N天

 @param dayCount 距离现在多少天
 @return 距离现在dayCount天的日期
 */
+ (NSString*)timeAfterNowTime:(int)dayCount;

/**
 计算时间差
 
 @param dateStringF 时间一
 @param dateStringT 时间二
 @return 时间差
 */
+ (NSArray *)timeIntervalFromLastDate: (NSString *) dateStringF  toTheDate:(NSString *) dateStringT;

/**
 JAVA13位时间戳转换为时间
 
 @param timeSing 时间戳
 @return 转换后的时间
 */
+ (NSString*)timeGetTimeByJAVATimeStamp:(NSString*)timeSing;

/**
 截取部分时间
 
 @param timeString 时间字符串
 @param format 截取目标
 @return 截取结果
 */

+ (NSString*)timeGetSubTime:(NSString *)timeString andFormat:(TimeFormat)format;

/**
 生日计算年龄
 
 @param birth 生日
 @return 年龄
 */
+ (NSString*)timeGetAgeByBir:(NSString*)birth;

@end
