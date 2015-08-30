//
//  Question.m
//  ZhiHu
//
//  Created by 严润发 on 15/6/14.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import "Question.h"

@implementation Question

- (instancetype)initWithTitle:(NSString *)title URL:(NSString *)url{
    if (self=[super init]) {
        _Title = title;
        _URL   = [@"http://www.zhihu.com" stringByAppendingString:url];
    }
    return self;
}

- (void)addAnswer:(Answer *)answer{
    if (!_Answers) {
        _Answers=[[NSMutableArray alloc]init];
    }
    [_Answers addObject:answer];
}

- (Answer *)firstAnswer{
    return [_Answers objectAtIndex:0];
}
@end
