//
//  Tool.h
//  HuaMiaoOC
//
//  Created by andy on 2017/7/3.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tool : NSObject

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

+ (BOOL)isNumText:(NSString *)str;

+ (BOOL)isSimplePasswordRule:(NSString *)password minLength:(NSInteger)minLenth maxLength:(NSInteger)maxLength;

+ (BOOL)isComposePasswordRule:(NSString *)password minLength:(NSInteger)minLenth maxLength:(NSInteger)maxLength;

+ (NSString *)getUTCFormatDate:(NSDate *)localDate;

+ (NSDate *)getLocalFromUTC:(NSString *)utc;

+ (NSDate *)stringToDate:(NSString *)strdate;

+ (NSString *)dateToString:(NSDate *)date;

+ (NSInteger)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;

    //增加了8小时
+ (NSDate *)getLocalDateFromDate:(NSDate *)date;

//结束时间比开始时间多了多少天
+ (NSInteger)numberOfDaysWithFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;
@end
