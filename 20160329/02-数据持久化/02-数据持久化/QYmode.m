//
//  QYmode.m
//  02-数据持久化
//
//  Created by qingyun on 16/3/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYmode.h"

@implementation QYmode
/**
 *  归档 将对象通过转码转换成二进制数据
 */
- (void)encodeWithCoder:(NSCoder *)aCoder{
   //[aCoder encodeObject:self forKey:@"name"];
   //将数据归档就可以
   //归档name
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_iconData forKey:@"iconData"];
    [aCoder encodeBool:_isSex forKey:@"sex"];
    [aCoder encodeInteger:_age forKey:@"age"];
  
}
/**
 *  解档操作 将归档过的二进制数据流 通过解码 转化成对象
 */
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super init]) {
    //解档
        _name=[aDecoder decodeObjectForKey:@"name"];
        _iconData=[aDecoder decodeObjectForKey:@"iconData"];
        _isSex=[aDecoder decodeBoolForKey:@"sex"];
        _age=[aDecoder decodeIntegerForKey:@"age"];
        
    }
    
    return self;
}


@end
