//
//  ImageProcesser.m
//  ZhiHu
//
//  Created by 严润发 on 15/8/22.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import "ImageProcesser.h"

@implementation ImageProcesser

+(void) getImageFromURL:(NSString *)url Then:(void(^)(UIImage *image)) block{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *imageData=[[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:url]];
        dispatch_async(dispatch_get_main_queue(), ^{
            block([UIImage imageWithData:imageData]);
        });
    });
}
@end
