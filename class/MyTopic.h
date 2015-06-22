//
//  MyTopic.h
//  ZhiHu
//
//  Created by 严润发 on 15/6/20.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface MyTopic : NSObject

@property NSString *TopicTitle;

@property NSString *TopicURL;

@property NSString *TopicImageURL;

@property NSMutableArray *NewQuestions;

-(MyTopic *)initWithTitle:(NSString *)title andURL:(NSString *)url andImage:(NSString *)imageUrl;

-(void)addQuestion:(Question *)question;

-(void)addQuestions:(NSMutableArray *)questions;

@end
