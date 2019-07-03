//
//  DateModel.m
//  CustomCalendar
//
//  Created by ZN on 2019/7/2.
//  Copyright © 2019年 nangnahz.nan. All rights reserved.
//

#import "DateModel.h"

@implementation DateModel

// 2019-07-03 YYYY-MM-dd
// 字符串格式，转时间，时间差
+ (NSInteger)totalDaysInMonthFromString:(NSString *)dateStr {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];//GMT
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *date = [formatter dateFromString:dateStr];
    return [self totalDaysInMonthFromDate:date];
}

+ (NSInteger)totalDaysInMonthFromDate:(NSDate *)date {
    NSRange dayRange = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return dayRange.length;
}

+ (NSInteger)weekDayMonthOfFirstDayFromString:(NSString *)dateStr {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];//GMT
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *date = [formatter dateFromString:dateStr];
    return [self totalDaysInMonthFromDate:date];
}

+ (NSInteger)weekDayMonthOfFirstDayFromDate:(NSDate *)date {
    // 1 sun  2 mon
    NSInteger firstDayOfMonthInt = [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitWeekOfMonth forDate:date];
    return firstDayOfMonthInt - 1;
}

@end
