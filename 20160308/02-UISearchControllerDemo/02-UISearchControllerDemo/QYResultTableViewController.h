//
//  QYResultTableViewController.h
//  02-UISearchControllerDemo
//
//  Created by qingyun on 16/3/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYResultTableViewController : UITableViewController<UISearchResultsUpdating>
@property (nonatomic, strong) NSArray *filterArray;
@end
