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

@property (copy, nonatomic) NSString *Title;

@property (copy, nonatomic) NSString *URL;

@property (copy, nonatomic) NSString *ImageURL;

@property (nonatomic, retain) NSMutableArray *NewQuestions;

-(MyTopic *)initWithTitle:(NSString *)title URL:(NSString *)url Image:(NSString *)imageUrl;

-(void)addQuestion:(Question *)question;

-(void)addQuestions:(NSMutableArray *)questions;

@end
