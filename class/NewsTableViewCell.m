//
//  NewsTableViewCell.m
//  ZhiHu
//
//  Created by 严润发 on 15/6/14.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "ImageProcesser.h"
@implementation NewsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)initUIFromContent:(id)content{
    _MyQuestion=(Question *)content;
    _MyAnswer = [_MyQuestion firstAnswer];
    _Replyer = [_MyAnswer Replyer];
    
    [_QuestionButton setTitle:[_MyQuestion Title] forState:UIControlStateNormal];
    [_AnswerButton setTitle:[_MyAnswer Short] forState:UIControlStateNormal];
    [_NewserNameLabel setText:[_Replyer Name]];
    [ImageProcesser getImageFromURL:[_Replyer ImageURL] Then:^(UIImage *image) {
        [_NewserImageView setBackgroundImage:image forState:UIControlStateNormal];
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
