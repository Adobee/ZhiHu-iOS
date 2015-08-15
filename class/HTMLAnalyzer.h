//
//  HTMLAnalyzer.h
//  ZhiHu
//
//  Created by 严润发 on 15/8/4.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTMLAnalyzer : NSObject

+(NSMutableArray *)Analysis:(NSString *)HTMLString WithIdentifier:(NSString *)identifier;

+(NSMutableArray *)TopicsAnalysis:(NSString *)HTMLString;

+(NSMutableArray *)DiscoverAnalysis:(NSString *)HTMLString;

@end
