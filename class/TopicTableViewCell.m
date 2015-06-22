//
//  TopicTableViewCell.m
//  ZhiHu
//
//  Created by 严润发 on 15/6/14.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import "TopicTableViewCell.h"
#import "AFNetworking.h"

@implementation TopicTableViewCell

- (void)awakeFromNib {
}

-(void)initUIFromTopic:(MyTopic *)topic{
    _topic=topic;
    [_TopicButton setTitle:_topic.TopicTitle forState:UIControlStateNormal];
    Question *one,*two,*three;
    if ([_topic.NewQuestions objectAtIndex:0])
        one=[_topic.NewQuestions objectAtIndex:0];
    if ([_topic.NewQuestions objectAtIndex:1])
        two=[_topic.NewQuestions objectAtIndex:1];
    if ([_topic.NewQuestions objectAtIndex:2])
        three=[_topic.NewQuestions objectAtIndex:2];
    switch (_topic.NewQuestions.count) {
        case 1:
            [_NewsOneButton setTitle:one.QuestionTitle forState:UIControlStateNormal];
        case 2:
            [_NewsOneButton setTitle:one.QuestionTitle forState:UIControlStateNormal];
            [_NewsTwoButton setTitle:two.QuestionTitle forState:UIControlStateNormal];
        case 3:
            [_NewsOneButton setTitle:one.QuestionTitle forState:UIControlStateNormal];
            [_NewsTwoButton setTitle:two.QuestionTitle forState:UIControlStateNormal];
            [_NewsThreeButton setTitle:three.QuestionTitle forState:UIControlStateNormal];
        default:
            break;
    }
    [self getImageFromURL];
}

-(void)getImageFromURL{
    /*
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager GET:_topic.TopicImageURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        UIImage *image=[[UIImage alloc]initWithData:responseObject];
        [_TopicButton.imageView setImage:image];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
     */
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *imageData=[[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:_topic.TopicImageURL]];
        UIImage *image=[[UIImage alloc]initWithData:imageData];
        dispatch_async(dispatch_get_main_queue(), ^{
            [_TopicImageView setImage:image];
        });
    });
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
