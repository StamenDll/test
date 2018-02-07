//
//  TimeSetClass.m
//  TestCommen
//
//  Created by XKXX_Apple on 2018/1/31.
//  Copyright © 2018年 XKXX. All rights reserved.
//

#import "TimeSetClass.h"

@implementation TimeSetClass

#pragma mark 获取当天时间
+ (NSString*)timeNow{
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    return dateString;
}

#pragma mark 获取距离现在N天的时间
+ (NSString*)timeAfterNowTime:(int)dayCount{
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDate *nextDat = [NSDate dateWithTimeInterval:24*dayCount*(int)pow(60,2) sinceDate:currentDate];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:nextDat];
    return dateString;
}

#pragma mark 时间差
+ (NSArray *)timeIntervalFromLastDate: (NSString *) dateString1  toTheDate:(NSString *) dateString2
{
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *d1=[date dateFromString:dateString1];
    
    NSTimeInterval late1=[d1 timeIntervalSince1970]*1;
    
    NSDate *d2=[date dateFromString:dateString2];
    
    NSTimeInterval late2=[d2 timeIntervalSince1970]*1;
    
    NSTimeInterval cha=late2-late1;
    NSString *timeString=@"";
    NSString *house=@"";
    NSString *min=@"";
    NSString *sen=@"";
    
    sen = [NSString stringWithFormat:@"%d", (int)cha%60];
    
    min = [NSString stringWithFormat:@"%d", (int)cha/60%60];
    min=[NSString stringWithFormat:@"%@", min];
    
    house = [NSString stringWithFormat:@"%d", (int)cha/3600];
    
    house=[NSString stringWithFormat:@"%@", house];
    
    timeString=[NSString stringWithFormat:@"%@:%@:%@",house,min,sen];
    
    NSArray *timeArray=@[house,min,sen];
    
    return timeArray;
}

#pragma mark 时间戳转换
+ (NSString*)timeGetTimeByJAVATimeStamp:(NSString*)timeSing{
    NSTimeInterval _interval=[timeSing doubleValue]/1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDateFormatter *objDateformat = [[NSDateFormatter alloc] init];
    [objDateformat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [objDateformat stringFromDate: date];
}

#pragma mark 截取目标格式时间串
+ (NSString*)timeGetSubTime:(NSString *)timeString andFormat:(TimeFormat)format{
    if (timeString.length>0) {
        NSArray *timeArray=[timeString componentsSeparatedByString:@" "];
        NSArray *date=[[timeArray objectAtIndex:0] componentsSeparatedByString:@"-"];
        NSArray *time=[[timeArray objectAtIndex:1] componentsSeparatedByString:@":"];
        NSString *resultString=timeString;
        if (format==0) {
            resultString=[timeArray objectAtIndex:0];
        }else if (format==1){
            resultString=[NSString stringWithFormat:@"%@-%@",[date objectAtIndex:0],[date objectAtIndex:1]];;
        }else if (format==2){
            resultString=[NSString stringWithFormat:@"%@-%@",[date objectAtIndex:1],[date objectAtIndex:2]];
        }else if (format==3){
            resultString=[timeArray objectAtIndex:2];
        }else if (format==4){
            resultString=[NSString stringWithFormat:@"%@:%@",[time objectAtIndex:0],[time objectAtIndex:1]];
        }
//        else if ([formt isEqualToString:@"MM-dd HH:mm"]){
//            resultString=[NSString stringWithFormat:@"%@-%@ %@:%@",[date objectAtIndex:1],[date objectAtIndex:2],[time objectAtIndex:0],[time objectAtIndex:1]];
//        }
        return resultString;
    }
    return @"";
}

#pragma mark 通过生日计算年龄
+ (NSString*)timeGetAgeByBir:(NSString*)birth {
    NSCalendar *calendar = [NSCalendar currentCalendar];//定义一个NSCalendar对象
    
    NSDate *nowDate = [NSDate date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //生日
    NSDate *birthDay = [dateFormatter dateFromString:birth];
    
    //用来得到详细的时差
    unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *date = [calendar components:unitFlags fromDate:birthDay toDate:nowDate options:0];
    
    if([date year] >0)
    {
        //        return [NSString stringWithFormat:(@"%ld岁%ld月%ld天"),(long)[date year],(long)[date month],(long)[date day]];
        return [NSString stringWithFormat:(@"%ld岁"),(long)[date year]];
        
    }
    else if([date month] >0)
    {
        //        return [NSString stringWithFormat:(@"%ld月%ld天"),(long)[date month],(long)[date day]];
        return [NSString stringWithFormat:(@"%ld月"),(long)[date month]];
    }
    else if([date day]>0){
        return [NSString stringWithFormat:(@"%ld天"),(long)[date day]];
    }
    return @"";
}

@end
