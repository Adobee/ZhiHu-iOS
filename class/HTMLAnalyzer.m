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
@implementation HTMLAnalyzer


+(NSMutableArray *)Analysis:(NSString *)HTMLString WithIdentifier:(NSString *)identifier{
    if ([identifier isEqualToString:@"TopicTableViewCell"]) {
        return [self TopicsAnalysis:HTMLString];
    }
    if ([identifier isEqualToString:@"DiscoverTableViewCell"]) {
        return [self DiscoverAnalysis:HTMLString];
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
        MyTopic *myTopic         = [[MyTopic alloc]initWithTitle:topicTitle andURL:topicURL andImage:topicImageURL];
        
        //初始化Question
        NSArray *questionNodes = [topicNode findChildrenOfClass:@"topic-feed-item"];
        for (HTMLNode *questionNode in questionNodes) {
            HTMLNode *question      = [questionNode findChildTag:@"a"];
            NSString *questionTitle = [question contents];
            NSString *questionURL   = [question getAttributeNamed:@"href"];
            Question *myQuestion    = [[Question alloc]initWithTitle:questionTitle andURL:questionURL];
            [myTopic addQuestion:myQuestion];
        }
        [topics addObject:myTopic];
    }
    
    /*
    NSString *topicNumFragment=[HTMLString firstMatch:RX(@"<span class=\"follow-topics-count\">\\d+</span>")];
    int topicNum=[[topicNumFragment firstMatch:RX(@"\\d+")] intValue];
    NSLog(@"%d",topicNum);
    
    NSArray *topicsFragments=[HTMLString matches:RX(@"<div class=\"topic-item-content\">[\\s\\S]*</div>")];
    for (NSString *s in topicsFragments) {
        NSLog(@"%@",s);
    }
     */
    /*
    TFHpple *htmlTree=[[TFHpple alloc]initWithHTMLData: HTMLData];
    NSArray *searchResult=[htmlTree searchWithXPathQuery:@"//span[@class='follow-topics-count']"];
    if ([searchResult count]==1) {
        TFHppleElement *element=searchResult[0];
         topic_num=[[element text] intValue];
    }
    
    NSArray *topics=[htmlTree searchWithXPathQuery:@"//div[@class='topic-item-content']"];
    for (int i=0; i<topic_num; i++) {
        TFHppleElement *element=topics[i];
        NSArray *children=[element childrenWithTagName:@"a"];
    }
     */
    return topics;
}

+(NSMutableArray *)DiscoverAnalysis:(NSString *)HTMLString{
    NSMutableArray *discovers=[[NSMutableArray alloc]init];
    
    HTMLParser *parser=[[HTMLParser alloc]initWithString:HTMLString error:nil];
    HTMLNode *rootNode=[parser body];
    
    NSArray *hotAnswerNodes=[rootNode findChildrenOfClass:@"explore-feed feed-item"];
    
    for (HTMLNode *hotAnswerNode in hotAnswerNodes) {
        HTMLNode *answer=[hotAnswerNode findChildOfClass:@"question_link"];
        NSString *answerURL = [answer getAttributeNamed:@"href"];
        NSString *answerShort = [[hotAnswerNode findChildOfClass:@"zh-summary summary clearfix"] contents];
        Answer *myAnswer=[[Answer alloc]initWithURL:answerURL AndShort:answerShort];
        
        NSString *questionTitle=[answer contents];
        
    }
    return discovers;
}
@end
