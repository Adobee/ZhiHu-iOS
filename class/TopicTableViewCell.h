//
//  TopicTableViewCell.h
//  ZhiHu
//
//  Created by 严润发 on 15/6/14.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTopic.h"
#import "Question.h"
#import "BaseTableViewCell.h"

@interface TopicTableViewCell :BaseTableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *TopicImageView;

@property (weak, nonatomic) IBOutlet UIButton *TopicButton;

@property (weak, nonatomic) IBOutlet UIButton *NewsOneButton;

@property (weak, nonatomic) IBOutlet UIButton *NewsTwoButton;

@property (weak, nonatomic) IBOutlet UIButton *NewsThreeButton;

@property MyTopic *topic;

@end
