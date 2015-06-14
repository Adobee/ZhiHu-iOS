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
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initUI{
    self.NewsTableView.dataSource=self;
    self.NewsTableView.delegate=self;
}


#pragma mark -Delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(NewsTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"NewsTableViewCell"];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"NewsTableViewCell" bundle:nil] forCellReuseIdentifier:@"NewsTableViewCell"];
        cell=[tableView dequeueReusableCellWithIdentifier:@"NewsTableViewCell"];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
