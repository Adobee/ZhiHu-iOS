//
//  DiscoverTableViewCell.m
//  ZhiHu
//
//  Created by 严润发 on 15/6/14.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import "DiscoverTableViewCell.h"

@implementation DiscoverTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)initUIFromAnswer:(Answer *)answer{
    _MyAnswer=answer;
    _AnswerTitle=answer;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
