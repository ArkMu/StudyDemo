//
//  MangaDB.m
//  02-数据持久化
//
//  Created by qingyun on 16/3/29.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "MangaDB.h"
#import "QYstudent.h"
#import "FMDB.h"

#define KDBFile @"students.db"

@interface MangaDB ()
//数据库对象
@property(nonatomic,strong)FMDatabase *dbase;
@end

@implementation MangaDB

-(FMDatabase *)dbase{
    if (_dbase) {
        return _dbase;
    }
    _dbase=[FMDatabase databaseWithPath:[self getFilePath]];
    
    return _dbase;

}



+(instancetype)shareDB{
    static dispatch_once_t once;
    static MangaDB *manag;
    dispatch_once(&once, ^{
     //执行1次
        manag=[[MangaDB alloc] init];
        //打开数据库
        if (![manag.dbase open]) {
            NSLog(@"=error==%@",[manag.dbase lastErrorMessage]);
            return ;
        }
        //1.创建表
        [manag createTable];

    });
    return manag;
}
//合并数据库路径
-(NSString*)getFilePath{
    NSString *libraryPath=NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
    //返回文件路径
    return [libraryPath stringByAppendingPathComponent:KDBFile];
}


//创建表
-(BOOL)createTable{
    
  //2.sql语句
    NSString *sql=@"create table if not exists students(ID integer primary key,name text,age integer,phone text,icon blob)";
    
    //创建表
     BOOL isresult= [self.dbase executeUpdate:sql];
    if (!isresult) {
        NSLog(@"创建 失败");
    }
    return isresult;
    
}


-(BOOL)insertIntoStudent:(QYstudent *)mode{

      //执行sql语句
     BOOL isresult=[self.dbase executeUpdate:@"insert into students(name,age,phone,icon)values(?,?,?,?)",mode.name,@(mode.age),mode.phone,mode.data];
    
    if (!isresult) {
        NSLog(@"插入失败");
      }
     return isresult;
}

//从预编译对象获取每个字段的值
-(QYstudent *)getValueFromStmt{
        return nil;
}

-(NSMutableArray*)selectStudentFromID:(int)ID{
    //执行查询操作返回一个 FMResultSet 集
   FMResultSet *set= [self.dbase executeQueryWithFormat:@"select * from students where ID=%d",ID];
    
    NSMutableArray *dataArr=[NSMutableArray array];
    while ([set next]) {
      //每次读取一行
        NSDictionary *result=[set resultDictionary];
        NSLog(@"======%@",result);
        //Kvc
        QYstudent *student=[QYstudent setStudentDic:result];
        
        
      //  int ID=[set intForColumn:@"ID"];
        //添加到数组
        [dataArr addObject:student];
    }
    
    
    
    return dataArr;
}
-(BOOL)UpdatefromStudent:(QYstudent *)mode
{
       return YES;
}
-(NSMutableArray *)selectAllStudent{
      return nil;
}
-(BOOL)deleteFromStudent:(int)ID{
    
    return YES;
}

@end
