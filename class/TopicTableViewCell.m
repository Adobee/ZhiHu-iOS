//
//  TopicTableViewCell.m
//  ZhiHu
//
//  Created by 严润发 on 15/6/14.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import "TopicTableViewCell.h"
#import "AFNetworking.h"
#import "ImageProcesser.h"
@implementation TopicTableViewCell

- (void)awakeFromNib {
}


-(void)initUIFromContent:(id)content{
    _topic=(MyTopic *)content;
    [_TopicButton setTitle:_topic.Title forState:UIControlStateNormal];
    Question *one,*two,*three;
    if ([_topic.NewQuestions count]>=1)
        one=[_topic.NewQuestions objectAtIndex:0];
    if ([_topic.NewQuestions count]>=2)
        two=[_topic.NewQuestions objectAtIndex:1];
    if ([_topic.NewQuestions count]>=3)
        three=[_topic.NewQuestions objectAtIndex:2];
    switch (_topic.NewQuestions.count) {
        case 1:
            [_NewsOneButton setTitle:one.Title forState:UIControlStateNormal];
        case 2:
            [_NewsOneButton setTitle:one.Title forState:UIControlStateNormal];
            [_NewsTwoButton setTitle:two.Title forState:UIControlStateNormal];
        case 3:
            [_NewsOneButton setTitle:one.Title forState:UIControlStateNormal];
            [_NewsTwoButton setTitle:two.Title forState:UIControlStateNormal];
            [_NewsThreeButton setTitle:three.Title forState:UIControlStateNormal];
        default:
            break;
    }
    [ImageProcesser getImageFromURL:_topic.ImageURL Then:^(UIImage *image) {
        [_TopicImageView setImage:image];
    }];
}

//下载话题图片
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
        NSData *imageData=[[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:_topic.ImageURL]];
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
