//
//  ImageProcesser.h
//  ZhiHu
//
//  Created by 严润发 on 15/8/22.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageProcesser : NSObject

+(void) getImageFromURL:(NSString *)url Then:(void(^)(UIImage *image)) block;
@end
