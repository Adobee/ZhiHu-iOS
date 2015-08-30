//
//  DiscoverViewController.h
//  ZhiHu
//
//  Created by 严润发 on 15/6/14.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface DiscoverViewController :BaseViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *HotSgmControl;

- (IBAction)segmentControl:(id)sender;

@end
