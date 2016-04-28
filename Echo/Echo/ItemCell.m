//
//  ItemCell.m
//  Echo
//
//  Created by qingyun on 16/4/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ItemCell.h"

#import "UIImageView+WebCache.h"

#import "ItemModel.h"

#import "SoundModel.h"
#import "ChannelModel.h"

@interface ItemCell ()

@property (weak, nonatomic) IBOutlet UIImageView *picImgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *channelNameLabel;

@end

@implementation ItemCell

- (void)setItemModel:(ItemModel *)itemModel {
    _itemModel = itemModel;
    
    SoundModel *soundModel = _itemModel.soundModel;
    [_picImgView sd_setImageWithURL:[NSURL URLWithString:soundModel.pic] placeholderImage:nil];
    
    _nameLabel.text = soundModel.name;
    
    ChannelModel *channelModel = soundModel.channelModel;
    _channelNameLabel.text = channelModel.name;
    
}

- (void)awakeFromNib {
    // Initialization code
}

@end
