//
//  Question.m
//  ZhiHu
//
//  Created by 严润发 on 15/6/14.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import "Question.h"

@implementation Question

-(Question *)initWithTitle:(NSString *)title andURL:(NSString *)url{
    if (self=[super init]) {
        _QuestionTitle = title;
        _QuestionURL   = [@"http://www.zhihu.com" stringByAppendingString:url];
    }
    return self;
}

@end
