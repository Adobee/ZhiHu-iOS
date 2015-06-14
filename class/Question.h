//
//  Question.h
//  ZhiHu
//
//  Created by 严润发 on 15/6/14.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Question : NSObject

@property NSString *QuestionTitle;

@property NSString *QuestionText;

@property User *Asker;

@property NSDictionary *Answers;

@end
