//
//  getKeyMethod.m
//  MyApp
//
//  Created by Alan on 15/12/9.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import "getKeyMethod.h"

@implementation getKeyMethod


//- (NSString*)getFirstKey{
//
//    NSString *date = [self getSystemTime];
//    
//
//}

- (NSString*)getkeyString:(NSInteger)i{

    //    //获得系统时间
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init ];
    [dateFormatter setDateFormat:@"YYYYMMdd"];
    // NSDate *now = [NSDate date];
    NSDate *tomorow = [NSDate dateWithTimeIntervalSinceNow:+(i*24*60*60)];
    NSString *datestring = [dateFormatter stringFromDate:tomorow];
    
    //NSLog(@"%@",datestring);
    NSString *string = @"day_";
    NSString *keystring = [string stringByAppendingString:datestring];
    
    //NSLog(@"%@",keystring);
    
    return keystring;
}


//-(NSString *)GetTomorrowDay:(NSDate *)aDate
//{
//    NSCalendar *gregorian = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
//                             
//                             
//                             
//    NSDateComponents *components = [gregorian components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:aDate];
//    [components setDay:([components day]+1)];
//    
//    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
//    NSDateFormatter *dateday = [[[NSDateFormatter alloc] init] autorelease];
//    [dateday setDateFormat:@"yyyy-MM-dd"];
//    return [dateday stringFromDate:beginningOfWeek];
//}


//@"day_YYMMdd"

@end
