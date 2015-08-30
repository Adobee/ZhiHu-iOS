//
//  BaseViewController.h
//  ZhiHu
//
//  Created by 严润发 on 15/8/15.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSString *identifier;

@property (strong, nonatomic) NSString *url;

-(void)initData;

@end
