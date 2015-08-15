//
//  TopicViewController.m
//  ZhiHu
//
//  Created by 严润发 on 15/6/14.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import "TopicViewController.h"

@interface TopicViewController ()

@end

@implementation TopicViewController

- (void)viewDidLoad{
    self.url=url_topic;
    self.identifier=@"TopicTableViewCell";
    self.tableView=(UITableView *)[self.view viewWithTag:1];
    [super viewDidLoad];
}


@end
