//
//  MyTopic.m
//  ZhiHu
//
//  Created by 严润发 on 15/6/20.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import "MyTopic.h"

@implementation MyTopic


-(MyTopic *)initWithTitle:(NSString *)title andURL:(NSString *)url andImage:(NSString *)imageUrl{
    if (self=[super init]) {
        _NewQuestions  = [[NSMutableArray alloc]init];
        _TopicTitle    = title;
        _TopicImageURL = imageUrl;
        _TopicURL      = [@"www.zhihu.com" stringByAppendingString:url];
    }
    return self;
}



-(void)addQuestion:(Question *)question{
    [_NewQuestions addObject:question];
}

-(void)addQuestions:(NSMutableArray *)questions{
    [_NewQuestions addObjectsFromArray:questions];
}
@end
