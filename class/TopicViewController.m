//
//  TopicViewController.m
//  ZhiHu
//
//  Created by 严润发 on 15/6/14.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import "TopicViewController.h"
#import "TopicTableViewCell.h"

@interface TopicViewController ()

@end

@implementation TopicViewController

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
    self.TopicTableView.dataSource=self;
    self.TopicTableView.delegate=self;
}


#pragma mark -Delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(TopicTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TopicTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"TopicTableViewCell"];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"TopicTableViewCell" bundle:nil] forCellReuseIdentifier:@"TopicTableViewCell"];
        cell=[tableView dequeueReusableCellWithIdentifier:@"TopicTableViewCell"];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(TopicTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
}


@end
