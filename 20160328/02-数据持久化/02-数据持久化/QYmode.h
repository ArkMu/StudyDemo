//
//  QYmode.h
//  02-数据持久化
//
//  Created by qingyun on 16/3/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYmode : NSObject<NSCoding>
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSData *iconData;
@property(nonatomic,assign)BOOL isSex;
@property(nonatomic,assign)NSInteger age;
@end
