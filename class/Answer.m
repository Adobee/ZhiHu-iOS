//
//  Answer.m
//  ZhiHu
//
//  Created by 严润发 on 15/6/14.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import "Answer.h"

@implementation Answer

-(instancetype)initWithURL:(NSString *)url Short:(NSString *)answer{
    if (self=[super init]) {
        _Short = [answer stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        _URL   = [@"http://www.zhihu.com" stringByAppendingString:url];
    }
    return self;
}


@end
