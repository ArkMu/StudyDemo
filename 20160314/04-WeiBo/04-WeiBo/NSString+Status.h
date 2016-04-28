//
//  NSString+Status.h
//  04-WeiBo
//
//  Created by qingyun on 16/3/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Status)
+(instancetype)createDateStringWithDate:(NSDate *)date;
+(instancetype)sourceWithHtmlString:(NSString *)html;
@end
