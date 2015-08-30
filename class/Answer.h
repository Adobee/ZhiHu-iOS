//
//  Answer.h
//  ZhiHu
//
//  Created by 严润发 on 15/6/14.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Answer : NSObject


@property (strong, nonatomic) User *Replyer;

@property (copy, nonatomic) NSString *Time;

@property (copy, nonatomic) NSString *Text;

@property (copy, nonatomic) NSString *Short;

@property (copy, nonatomic) NSString *URL;

@property (nonatomic, retain) NSMutableArray *Replys;

@property (copy, nonatomic) NSString *Vote;

- (instancetype)initWithURL:(NSString *)url Short:(NSString *)answer;

@end
