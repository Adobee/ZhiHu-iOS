//
//  DiscoverViewController.m
//  ZhiHu
//
//  Created by 严润发 on 15/6/14.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import "DiscoverViewController.h"
#import "conf.h"

@interface DiscoverViewController ()

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    self.url=url_explore_daily;
    self.identifier=@"DiscoverTableViewCell";
    self.tableView=(UITableView *)[self.view viewWithTag:1];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)segmentControl:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        self.url=url_explore_daily;
    }
    else if (sender.selectedSegmentIndex == 1){
        self.url=url_explore_month;
    }
    [self initData];
}
@end
