//
//  Answer.m
//  ZhiHu
//
//  Created by 严润发 on 15/6/14.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import "Answer.h"

@implementation Answer

-(Answer *)initWithURL:(NSString *)url AndShort:(NSString *)answer{
    if (self=[super init]) {
        _AnswerShort = answer;
        _AnswerURL   = url;
    }
    return self;
}

@end
