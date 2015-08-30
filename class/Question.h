//
//  Question.h
//  ZhiHu
//
//  Created by 严润发 on 15/6/14.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Answer.h"
@interface Question : NSObject

@property (copy,nonatomic) NSString *Title;

@property (copy,nonatomic) NSString *Text;

@property (copy,nonatomic) NSString *URL;

@property (copy,nonatomic) NSMutableArray *Answers;


- (instancetype)initWithTitle:(NSString *)title URL:(NSString *)url;

- (void)addAnswer:(Answer *)answer;

- (Answer *)firstAnswer;
@end
