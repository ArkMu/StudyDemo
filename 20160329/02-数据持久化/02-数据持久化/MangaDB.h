//
//  MangaDB.h
//  02-数据持久化
//
//  Created by qingyun on 16/3/29.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
@class QYstudent;
@interface MangaDB : NSObject

+(instancetype)shareDB;
/**
 *  insert 插入数据
 */
-(BOOL)insertIntoStudent:(QYstudent *)mode;

/**
 *  更新数据
 *
 */
-(BOOL)UpdatefromStudent:(QYstudent *)mode;

/**
 *  查询单个
 */
-(NSMutableArray*)selectStudentFromID:(int)ID;

/**
 *  查询所有
 */
-(NSMutableArray *)selectAllStudent;
-(BOOL)deleteFromStudent:(int)ID;
@end
