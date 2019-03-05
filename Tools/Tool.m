//
//  Tool.m
//  HuaMiaoOC
//
//  Created by andy on 2017/7/3.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Tool.h"

@implementation Tool

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (BOOL)isNumText:(NSString *)str
{
    NSString * regex= @"^[0-9]*$";
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:str];
    if (isMatch){
        return YES;
    }
    else{
        return NO;
    }
}

+ (BOOL)isSimplePasswordRule:(NSString *)password minLength:(NSInteger)minLenth maxLength:(NSInteger)maxLength
{
    NSString *regex = [NSString stringWithFormat:@"^[a-zA-Z0-9]{%zd,%zd}+$",minLenth-1,maxLength-1];
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:regex];
    if (isMatch){
        return YES;
    }
    else{
        return NO;
    }

}

+ (BOOL)isComposePasswordRule:(NSString *)password minLength:(NSInteger)minLenth maxLength:(NSInteger)maxLength
{
    NSString *regex = [NSString stringWithFormat:@"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{%zd,%zd}$",minLenth,maxLength];
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:password];
    if (isMatch){
        return YES;
    }
    else{
        return NO;
    }
    
}

+ (NSString *)getUTCFormatDate:(NSDate *)localDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    NSString *dateString = [dateFormatter stringFromDate:localDate];
    return dateString;
}

+ (NSDate *)getLocalDateFromDate:(NSDate *)date
{
    NSTimeZone * zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    date = [date dateByAddingTimeInterval:interval];
    return date;
}
+ (NSDate *)getLocalFromUTC:(NSString *)utc
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    NSDate *ldate = [dateFormatter dateFromString:utc];

    return ldate;
}

+ (NSDate *)stringToDate:(NSString *)strdate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *retdate = [dateFormatter dateFromString:strdate];
    return retdate;
}

    //NSDate 2 NSString
+ (NSString *)dateToString:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}

+ (NSInteger)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    
    NSComparisonResult result = [dateA compare:dateB];
    
    if (result == NSOrderedDescending) {
            //NSLog(@"oneDay比 anotherDay时间晚");
        return 1;
    }
    else if (result == NSOrderedAscending){
            //NSLog(@"oneDay比 anotherDay时间早");
        return -1;
    }
        //NSLog(@"两者时间是同一个时间");
    return 0;
}

+ (NSInteger)numberOfDaysWithFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate
{
        // 创建一个标准国际时间的日历
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        // 可根据需要自己设置时区.
    calendar.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
        // 获取两个日期的间隔
    NSDateComponents *comp = [calendar components:NSCalendarUnitDay|NSCalendarUnitHour fromDate:fromDate toDate:toDate options:NSCalendarWrapComponents];
    return comp.day;
//    NSInteger hour = (comp.hour - comp.day * 24);
//    return [NSString stringWithFormat:@"%ld天%ld小时", comp.day, hour];
}


@end
