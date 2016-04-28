//
//  QYstudent.h
//  02-数据持久化
//
//  Created by qingyun on 16/3/29.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYstudent : NSObject
@property(nonatomic,assign)NSInteger ID;//ID
@property(nonatomic,strong)NSString *name;//姓名
@property(nonatomic,assign)NSInteger age;//年龄
@property(nonatomic,strong)NSString *phone;//电话
@property(nonatomic,strong)NSData *data;//头像

+(instancetype)setStudentDic:(NSDictionary *)valueDic;

@end
