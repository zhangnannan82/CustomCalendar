//
//  DateModel.h
//  CustomCalendar
//
//  Created by ZN on 2019/7/2.
//  Copyright © 2019年 nangnahz.nan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateModel : NSObject

+ (NSInteger)totalDaysInMonthFromString:(NSString *)dateStr;
+ (NSInteger)totalDaysInMonthFromDate:(NSDate *)date;

// 返回每个月第一天是周几
+ (NSInteger)weekDayMonthOfFirstDayFromString:(NSString *)dateStr;
+ (NSInteger)weekDayMonthOfFirstDayFromDate:(NSDate *)date;

@end
