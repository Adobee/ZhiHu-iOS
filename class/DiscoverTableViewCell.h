//
//  DiscoverTableViewCell.h
//  ZhiHu
//
//  Created by 严润发 on 15/6/14.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"
#import "Question.h"

@interface DiscoverTableViewCell :BaseTableViewCell

@property (weak, nonatomic) IBOutlet UIButton *QuestionTitle;

@property (weak, nonatomic) IBOutlet UIButton *AnswerTitle;

@property (strong, nonatomic) Question *MyQuestion;

@end
