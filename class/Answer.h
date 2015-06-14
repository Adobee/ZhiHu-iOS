//
//  Answer.h
//  ZhiHu
//
//  Created by 严润发 on 15/6/14.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Answer : NSObject


@property User *Replyer;

@property NSString *Time;

@property NSString *AnswerText;

@property NSDictionary *Replys;

@end
