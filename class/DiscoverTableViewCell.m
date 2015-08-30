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

- (void)initUIFromContent:(id)content{
    _MyQuestion=(Question *)content;
    [_QuestionTitle setTitle:[_MyQuestion Title] forState:UIControlStateNormal];
    [_AnswerTitle setTitle:[[_MyQuestion firstAnswer] Short] forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
