//
//  MangaDB.m
//  02-数据持久化
//
//  Created by qingyun on 16/3/29.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "MangaDB.h"
#import <sqlite3.h>
#import "QYstudent.h"

#define KDBFile @"students.db"
//1.这里声明一个sqlite3 数据库连接对象指针,用于全局,db只能在.m使用
//2.db 就是数据连接对象
static sqlite3 *db;


@implementation MangaDB

+(instancetype)shareDB{
    static dispatch_once_t once;
    static MangaDB *manag;
    
    dispatch_once(&once, ^{
     //执行1次
        manag=[[MangaDB alloc] init];
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

-(BOOL)openDB{
      //打开数据库
    if (db) {
        return YES;
    }
    //创建数据库链接对象,打开数据
    int result=sqlite3_open([[self getFilePath] UTF8String], &db);
    if (result==SQLITE_OK) {
        NSLog(@"open ok");
        return YES;
        
    }
    NSLog(@"=====open error===%s",sqlite3_errmsg(db));
    return NO;
}

-(BOOL)closeDB{
    //关闭数据库连接,同时释放对象
    int result=sqlite3_close(db);
    if (result!=SQLITE_OK) {
        return NO;
    }
    //db指向NULL
    db=NULL;
    NSLog(@"===close db ok");
    return YES;
}

//创建表
-(BOOL)createTable{
  //1.打开数据库
    if(![self openDB]) return NO;
 
  //2.sql语句
    NSString *sql=@"create table if not exists students(ID integer primary key,name text,age integer,phone text,icon blob)";
    
    
  //3.执行sql语句
     char *errmsg;
     int result=sqlite3_exec(db, [sql UTF8String], NULL, NULL, &errmsg);
     if (result!=SQLITE_OK) {
       
         NSLog(@"======%s",errmsg);
         //释放errmsg
         sqlite3_free(errmsg);
         //关闭数据库
         [self closeDB];
         return NO;
     }
    //关闭数据库
    [self closeDB];
    return YES;
}


-(BOOL)insertIntoStudent:(QYstudent *)mode{
   //1.打开数据库
    if (![self openDB]) {
        return NO;
    }
   //2.编写sql语句
    NSString *sql=@"insert into students (name,age,phone,icon)values(?,?,?,?)";
    
   //3编译sql语句 转化成预编译对象
    //声明预编译对象的指针
     sqlite3_stmt *stmt;
    //第三个参数表示sql的长度 -1 表示全部
    //第五个参数,sql字符串的地址,对我们没有用NULl
    int reust=sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, NULL);
    if(reust!=SQLITE_OK){
        NSLog(@"==预编译失败==%s",sqlite3_errmsg(db));
        //关闭数据库
        [self closeDB];
        return NO;
    }
    //4.bind 参数
    //第二个参数表示 1表示占位符的位置,参数的位置
    //第四个参数 -1 表示字符串的长度,全部
    //第五个参数 NUL 字符串地址
    sqlite3_bind_text(stmt, 1, [mode.name UTF8String], -1, NULL);
    sqlite3_bind_int(stmt, 2, (int)mode.age);
    sqlite3_bind_text(stmt, 3, [mode.phone UTF8String], -1, NULL);
    sqlite3_bind_blob(stmt, 4, [mode.data bytes],(int)mode.data.length, NULL);
    
    //5执行预编译对象 step
    //insert,update,delete 对于这些操作,不需要返回结果SQLITE_DONE
    //select 对于查询有结果列表,对应这些操作,返回值SQLITE_ROW 每次只会给你返回一行
    reust=sqlite3_step(stmt);

    if (reust!=SQLITE_DONE) {
      //销毁预编译对象
        sqlite3_finalize(stmt);
      //关闭数据库
        [self closeDB];
        return NO;
    }
    
    //6.销毁预编译对象
    sqlite3_finalize(stmt);
    
    //7.关闭数据库
    [self closeDB];
    
    return YES;
}

//从预编译对象获取每个字段的值
-(QYstudent *)getValueFromStmt:(sqlite3_stmt *)stmt{
    QYstudent *student=[[QYstudent alloc] init];
    //1.提取ID
    int ID=sqlite3_column_int(stmt, 0);
    //2.提取name
    const unsigned char *charName= sqlite3_column_text(stmt, 1);
    //3.age
    int age=sqlite3_column_int(stmt, 2);
    //4.phone
    const unsigned char *charPhone=sqlite3_column_text(stmt, 3);
    //5.头像
     const void *iconData=sqlite3_column_blob(stmt, 4);
    
    student.ID=ID;
    student.name=[NSString stringWithUTF8String:(const char *)charName];
    student.age=age;
    student.phone=[NSString stringWithUTF8String:(const char *)charPhone];
    int len=sqlite3_column_bytes(stmt, 4);
    //int len =strlen(iconData)
    student.data=[NSData dataWithBytes:iconData length:len];
    
    return student;
}

-(NSMutableArray*)selectStudentFromID:(int)ID{
  //1.打开数据库
    if(![self openDB])return nil;
  //2.编写sql语句
    NSString *sql=@"select * from students where ID=?";
    
  //3.将sql转换成预编译对象
    //3.1声明预编译对象
    sqlite3_stmt *stmt;
    int result=sqlite3_prepare_v2(db,[sql UTF8String], -1, &stmt, NULL);
    if (result!=SQLITE_OK) {
        NSLog(@"预编译失败");
        [self closeDB];
        return nil;
    }
  //4.bind 参数
    sqlite3_bind_int(stmt, 1, ID);
    
  //5.执行预编译对象
    //1.select 操作,查询有结果集 结果SQLITE_ROW
    //每次循环读取一行
     NSMutableArray *dataArr=[NSMutableArray array];
    while (sqlite3_step(stmt)==SQLITE_ROW) {
        //获取每行的字段
       QYstudent *mode=[self getValueFromStmt:stmt];
        [dataArr addObject:mode];
        
    }
  //6.销毁预编译对象
    sqlite3_finalize(stmt);
  //7.关闭数据库
    [self closeDB];
    
    return dataArr;
}
-(BOOL)UpdatefromStudent:(QYstudent *)mode
{
    //1.打开数据库
    if (![self openDB]) {
        return NO;
    }
    //2.编写sql语句
    NSString *sql=@"update  students set name = ? ,age = ?, phone = ?, icon = ? where ID = ? ";
    
    //3编译sql语句 转化成预编译对象
    //声明预编译对象的指针
    sqlite3_stmt *stmt;
    //第三个参数表示sql的长度 -1 表示全部
    //第五个参数,sql字符串的地址,对我们没有用NULl
    int reust=sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, NULL);
    if(reust!=SQLITE_OK){
        NSLog(@"==预编译失败==%s",sqlite3_errmsg(db));
        //关闭数据库
        [self closeDB];
        return NO;
    }
    //4.bind 参数
    //第二个参数表示 1表示占位符的位置,参数的位置
    //第四个参数 -1 表示字符串的长度,全部
    //第五个参数 NUL 字符串地址
    sqlite3_bind_text(stmt, 1, [mode.name UTF8String], -1, NULL);
    sqlite3_bind_int(stmt, 2, (int)mode.age);
    sqlite3_bind_text(stmt, 3, [mode.phone UTF8String], -1, NULL);
    sqlite3_bind_blob(stmt, 4, [mode.data bytes],(int)mode.data.length, NULL);
    sqlite3_bind_int(stmt, 5, (int)mode.ID);
    //5执行预编译对象 step
    //insert,update,delete 对于这些操作,不需要返回结果SQLITE_DONE
    //select 对于查询有结果列表,对应这些操作,返回值SQLITE_ROW 每次只会给你返回一行
    reust=sqlite3_step(stmt);
    
    if (reust!=SQLITE_DONE) {
        //销毁预编译对象
        sqlite3_finalize(stmt);
        //关闭数据库
        [self closeDB];
        return NO;
    }
    
    //6.销毁预编译对象
    sqlite3_finalize(stmt);
    
    //7.关闭数据库
    [self closeDB];
    
    return YES;}
-(NSMutableArray *)selectAllStudent{
  //1.打开数据库
    if(![self openDB])return nil;
  //2.编写sql
    NSString *sql=@"select * from students ";
  //3.将sql转换成预编译对象
    //声明下预编译对象
    sqlite3_stmt *stmt;
    int result=sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, NULL);
    if (result!=SQLITE_OK) {
        [self closeDB];
        return nil;
    }
  //4.bind 参数
    
  //5.执行编译对象
    NSMutableArray *dataArr=[NSMutableArray array];
    while (sqlite3_step(stmt)==SQLITE_ROW) {
        QYstudent *mode=[self getValueFromStmt:stmt];
        [dataArr addObject:mode];
    }
  //6.销毁预编对象
    sqlite3_finalize(stmt);
  //7.关闭数数据库
    [self closeDB];
    return dataArr;
}
-(BOOL)deleteFromStudent:(int)ID{
    //1.打开数据库
    if(![self openDB])return NO;
    //2.编写sql语句
    NSString *sql=@"delete  from students where ID=?";
    
    //3.将sql转换成预编译对象
    //3.1声明预编译对象
    sqlite3_stmt *stmt;
    int result=sqlite3_prepare_v2(db,[sql UTF8String], -1, &stmt, NULL);
    if (result!=SQLITE_OK) {
        NSLog(@"预编译失败");
        [self closeDB];
        return NO;
    }
    
    //4.bind 参数
     sqlite3_bind_int(stmt, 1, ID);
     result=sqlite3_step(stmt);
    if (result != SQLITE_DONE) {
        [self closeDB];
        return NO;
    }
 
    
    //6.销毁预编译对象
    sqlite3_finalize(stmt);
    //7.关闭数据库
    [self closeDB];
    
    return YES;
}

@end
