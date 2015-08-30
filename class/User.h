//
//  User.h
//  ZhiHu
//
//  Created by 严润发 on 15/6/14.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (copy, nonatomic) NSString *Name;

@property (copy, nonatomic) NSString *URL;

@property (copy, nonatomic) NSString *Motto;

@property (copy, nonatomic) NSString *ImageURL;

- (instancetype) initWithName:(NSString *)name Motto:(NSString *)motto URL:(NSString *)url;

- (instancetype) initWithName:(NSString *)name URL:(NSString *)url ImageURL:(NSString *)imageURL;
@end
