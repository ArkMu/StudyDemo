//
//  NSString+Status.m
//  04-WeiBo
//
//  Created by qingyun on 16/3/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "NSString+Status.h"

@implementation NSString (Status)
+(instancetype)createDateStringWithDate:(NSDate *)date{
    //1 计算时间差
    NSTimeInterval interval = -[date timeIntervalSinceNow];
    //2 根据时间差来确定时间级别
    if (interval < 60) {//秒级
        return [NSString stringWithFormat:@"刚刚 %d 秒前",(int)interval];
    }else if (interval < 60 * 60){//分级
        return [NSString stringWithFormat:@"刚刚 %d 分前",(int)interval / 60];
    }else if (interval < 60 * 60 * 24){//时级
        return [NSString stringWithFormat:@"刚刚 %d 时前",(int)interval / (60 * 60)];
    }else if (interval < 60 * 60 * 24 * 30){//天级
        return [NSString stringWithFormat:@"刚刚 %d 天前",(int)interval / (60 * 60 * 24)];
    }else{
        /*(NSDateFormatterStyle)
        NSDateFormatterNoStyle
        例如: (空白)
        NSDateFormatterShortStyle
        如:下午 7:00   /   16/3/14
        NSDateFormatterMediumStyle
        如:下午 7:00:00  /  2016年3月14日
        NSDateFormatterLongStyle
        如:GMT +8 下午 7:00:00    /   2016年3月14日
        NSDateFormatterFullStyle
        如:中国标准时间下午7:00:00   /  2016年3月14日 星期一
        */
        return [NSDateFormatter localizedStringFromDate:date dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterNoStyle];
    }
    
}


+(instancetype)sourceWithHtmlString:(NSString *)html{
    //<a href="http://weibo.com/" rel="nofollow">微博 weibo.com</a>
    if (html.length == 0) {
        return nil;
    }
    
    NSString *regExString = @">.*<";
    NSError *error = nil;
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:regExString options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSTextCheckingResult *result = [regularExpression firstMatchInString:html options:NSMatchingReportProgress range:NSMakeRange(0, html.length)];
    if (result) {
        NSRange resultRang = result.range;
        NSString *resultString = [html substringWithRange:NSMakeRange(resultRang.location + 1, resultRang.length - 2)];
        return resultString;
    }
    return nil;
}











@end
