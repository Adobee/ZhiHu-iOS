//
//  HTMLAnalyzer.m
//  ZhiHu
//
//  Created by 严润发 on 15/8/4.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import "HTMLAnalyzer.h"
#import "HTMLParser.h"
#import "MyTopic.h"
#import "Question.h"
#import "Answer.h"
#import "User.h"
@implementation HTMLAnalyzer


+(NSMutableArray *)Analysis:(NSString *)HTMLString WithIdentifier:(NSString *)identifier{
    if ([identifier isEqualToString:@"TopicTableViewCell"]) {
        return [self TopicsAnalysis:HTMLString];
    }
    if ([identifier isEqualToString:@"DiscoverTableViewCell"]) {
        return [self DiscoverAnalysis:HTMLString];
    }
    if ([identifier isEqualToString:@"NewsTableViewCell"]) {
        return [self NewsAnalysis:HTMLString];
    }
    return nil;
}

+(NSMutableArray *)TopicsAnalysis:(NSString *)HTMLString{
    NSMutableArray *topics=[[NSMutableArray alloc]init];
    
    HTMLParser *parser=[[HTMLParser alloc]initWithString:HTMLString error:nil];
    HTMLNode *rootNode=[parser body];
    int topicNum=[[[rootNode findChildOfClass:@"follow-topics-count"] contents] intValue];
    
    NSArray *topicNodes=[rootNode findChildrenOfClass:@"topic-item-content"];
    for (int i=0; i<topicNum; i++) {
        HTMLNode *topicNode = topicNodes[i];
        
        //初始化Topic
        HTMLNode *topic          = [topicNode findChildOfClass:@"topic-item-title-link"];
        NSString *topicTitle     = [topic contents];
        NSString *topicURL       = [topic getAttributeNamed:@"href"];
        HTMLNode *topicImageNode = [rootNode findChildWithAttribute:@"href" matchingName:topicURL allowPartial:YES];
        NSString *topicImageURL  = [[topicImageNode findChildTag:@"img"] getAttributeNamed:@"src"];
        MyTopic *myTopic         = [[MyTopic alloc]initWithTitle:topicTitle URL:topicURL Image:topicImageURL];
        
        //初始化Question
        NSArray *questionNodes = [topicNode findChildrenOfClass:@"topic-feed-item"];
        for (HTMLNode *questionNode in questionNodes) {
            HTMLNode *question      = [questionNode findChildTag:@"a"];
            NSString *questionTitle = [question contents];
            NSString *questionURL   = [question getAttributeNamed:@"href"];
            Question *myQuestion    = [[Question alloc]initWithTitle:questionTitle URL:questionURL];
            [myTopic addQuestion:myQuestion];
        }
        [topics addObject:myTopic];
    }
    return topics;
}

+(NSMutableArray *)DiscoverAnalysis:(NSString *)HTMLString{
    NSMutableArray *discovers=[[NSMutableArray alloc]init];
    
    HTMLParser *parser=[[HTMLParser alloc]initWithString:HTMLString error:nil];
    HTMLNode *rootNode=[parser body];
    
    NSArray *hotAnswerNodes=[rootNode findChildrenOfClass:@"explore-feed feed-item"];
    
    for (HTMLNode *hotAnswerNode in hotAnswerNodes) {
        //初始化问题
        HTMLNode *question      = [hotAnswerNode findChildOfClass:@"question_link"];
        NSString *questionURL   = [question getAttributeNamed:@"href"];
        NSString *questionTitle = [question contents];
        Question* myQuestion    = [[Question alloc]initWithTitle:questionTitle URL:questionURL];
        //初始化回答
        HTMLNode *answer        = [hotAnswerNode findChildOfClass:@"zh-summary summary clearfix"];
        NSArray *answerText     = [answer findChildTags:@"text"];
        NSString *answerShort   = @"";
        for (HTMLNode* textNode in answerText)
            answerShort=[NSString stringWithFormat:@"%@%@",answerShort,[textNode allContents]];
        NSString *answerURL     = [[answer findChildTag:@"a"] getAttributeNamed:@"href"];
        Answer *myAnswer        = [[Answer alloc]initWithURL:answerURL Short:answerShort];
        //初始化回答的人
        HTMLNode *people        = [hotAnswerNode findChildOfClass:@"zm-item-answer-author-wrap"];
        NSString *peopleName    = [[people findChildTag:@"a"] contents];
        NSString *peopleMotto   = [[people findChildOfClass:@"zu-question-my-bio"] contents];
        NSString *peopleURL     = [[people findChildTag:@"a"] getAttributeNamed:@"href"];
        User     *user          = [[User alloc]initWithName:peopleName Motto:peopleMotto URL:peopleURL];
        //添加关系
        [myAnswer setReplyer:user];
        [myQuestion addAnswer:myAnswer];
        [discovers addObject:myQuestion];
    }
    return discovers;
}


+ (NSMutableArray *)NewsAnalysis:(NSString *)HTMLString{
    NSMutableArray *news = [[NSMutableArray alloc]init];
    HTMLParser *parser=[[HTMLParser alloc]initWithString:HTMLString error:nil];
    HTMLNode *rootNode=[parser body];

    NSArray *newsNodes = [rootNode findChildrenOfClass:@"feed-item folding feed-item-hook feed-item-a\n\n"];
    for (HTMLNode* newsNode in newsNodes) {
        //初始化回答的人
        HTMLNode *people         = [newsNode findChildOfClass:@"zm-item-link-avatar"];
        NSString *peopleName     = [people getAttributeNamed:@"title"];
        NSString *peopleURL      = [people getAttributeNamed:@"href"];
        NSString *peopleImageURL = [[people findChildTag:@"img"] getAttributeNamed:@"src"];
        User *user               = [[User alloc]initWithName:peopleName URL:peopleURL ImageURL:peopleImageURL];
        //初始化问题
        HTMLNode *question      = [newsNode findChildOfClass:@"question_link"];
        NSString *questionURL   = [question getAttributeNamed:@"href"];
        NSString *questionTitle = [question contents];
        Question* myQuestion    = [[Question alloc]initWithTitle:questionTitle URL:questionURL];
        //初始化回答
        HTMLNode *answer        = [newsNode findChildOfClass:@"zh-summary summary clearfix"];
        NSArray *answerText     = [answer findChildTags:@"text"];
        NSString *answerShort   = @"";
        for (HTMLNode* textNode in answerText)
            answerShort=[NSString stringWithFormat:@"%@%@",answerShort,[textNode allContents]];
        NSString *answerURL     = [[newsNode findChildOfClass:@"answer-date-link meta-item"] getAttributeNamed:@"href"];
        if (!answerURL) {
            answerURL = [[newsNode findChildOfClass:@"answer-date-link last_updated meta-item"] getAttributeNamed:@"href"];
        }
        Answer *myAnswer        = [[Answer alloc]initWithURL:answerURL Short:answerShort];
        
        //添加关系
        [myAnswer setReplyer:user];
        [myQuestion addAnswer:myAnswer];
        [news addObject:myQuestion];
    }
    return news;
    
}
@end
