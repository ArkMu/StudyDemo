//
//  NSDate+Status.m
//  04-WeiBo
//
//  Created by qingyun on 16/3/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "NSDate+Status.h"

@implementation NSDate (Status)
//微博字符串转化成date
+(instancetype)statusDateWithString:(NSString *)dateString{
    NSString *dateFormatter = @"EEE MMM dd HH:mm:ss zzz yyyy";
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = dateFormatter;
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en"];
    return [formatter dateFromString:dateString];
}
@end
