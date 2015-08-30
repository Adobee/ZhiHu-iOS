//
//  NewsViewController.m
//  ZhiHu
//
//  Created by 严润发 on 15/6/14.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsTableViewCell.h"

@interface NewsViewController ()

@end

@implementation NewsViewController

- (void)viewDidLoad {
    self.url=url_news;
    self.identifier=@"NewsTableViewCell";
    self.tableView=(UITableView *)[self.view viewWithTag:1];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
