//
//  MyTopic.m
//  ZhiHu
//
//  Created by 严润发 on 15/6/20.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import "MyTopic.h"

@implementation MyTopic


-(MyTopic *)initWithTitle:(NSString *)title URL:(NSString *)url Image:(NSString *)imageUrl{
    if (self=[super init]) {
        _NewQuestions  = [[NSMutableArray alloc]init];
        _Title    = title;
        _ImageURL = imageUrl;
        _URL      = [@"www.zhihu.com" stringByAppendingString:url];
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
