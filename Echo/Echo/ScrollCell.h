//
//  ScrollCell.h
//  Echo
//
//  Created by qingyun on 16/4/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ScrollModel;

@interface ScrollCell : UICollectionViewCell

@property (nonatomic, strong) NSArray<ScrollModel *> *mArr;

@end
