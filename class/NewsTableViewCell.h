//
//  NewsTableViewCell.h
//  ZhiHu
//
//  Created by 严润发 on 15/6/14.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"
#import "Question.h"
#import "Answer.h"

@interface NewsTableViewCell :BaseTableViewCell

@property (weak, nonatomic) IBOutlet UIButton *NewserImageView;

@property (weak, nonatomic) IBOutlet UILabel *NewserNameLabel;

@property (weak, nonatomic) IBOutlet UIButton *QuestionButton;

@property (weak, nonatomic) IBOutlet UIButton *AnswerButton;

@property (strong, nonatomic) Question *MyQuestion;

@property (strong, nonatomic) Answer *MyAnswer;

@property (strong, nonatomic) User *Replyer;
@end
