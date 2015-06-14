//
//  DiscoverViewController.m
//  ZhiHu
//
//  Created by 严润发 on 15/6/14.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import "DiscoverViewController.h"
#import "DiscoverTableViewCell.h"

@interface DiscoverViewController ()

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initUI{
    self.DiscoverTableView.delegate=self;
    self.DiscoverTableView.dataSource=self;
}

#pragma mark -Delegate


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(DiscoverTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DiscoverTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"DiscoverTableViewCell"];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"DiscoverTableViewCell" bundle:nil] forCellReuseIdentifier:@"DiscoverTableViewCell"];
        cell=[tableView dequeueReusableCellWithIdentifier:@"DiscoverTableViewCell"];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(DiscoverTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
