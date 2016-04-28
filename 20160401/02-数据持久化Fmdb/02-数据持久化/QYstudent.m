//
//  QYstudent.m
//  02-数据持久化
//
//  Created by qingyun on 16/3/29.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYstudent.h"

@implementation QYstudent
//kvc 找不到key 需要自己设置
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"icon"]){
        _data=value;
    }

    
}

+(instancetype)setStudentDic:(NSDictionary *)valueDic{
    QYstudent *mode=[[QYstudent alloc] init];
    [mode setValuesForKeysWithDictionary:valueDic];
    return mode;
}
@end
