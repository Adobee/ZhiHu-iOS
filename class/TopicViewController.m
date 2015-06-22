//
//  TopicViewController.m
//  ZhiHu
//
//  Created by 严润发 on 15/6/14.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import "TopicViewController.h"
#import "TopicTableViewCell.h"
#import "AFNetworking.h"
#import "JSONKit.h"
#import "MyTopic.h"
#import "Question.h"
@interface TopicViewController ()

@end

@implementation TopicViewController{
    NSMutableArray *topics;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    topics=[[NSMutableArray alloc]init];

    [self initData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initUI{
    [self.TopicTableView setDataSource:self];
    [self.TopicTableView setDelegate:self];
}

-(void)receiveData:(NSData *)data{
    NSArray *array=(NSArray *)data;
    for (int i=0; i<array.count; i++) {
        MyTopic *topic=[[MyTopic alloc]initWithTitle:array[i][0] andURL:array[i][1] andImage:array[i][2]];
        NSArray *questionArray=array[i][3];
        for (int j=0; j<questionArray.count; j++){
            Question *question=[[Question alloc]initWithTitle:questionArray[j][0] andURL:questionArray[j][1]];
            [topic addQuestion:question];
        }
        [topics addObject:topic];
    }
    [self initUI];
}

-(void)initData{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    manager.responseSerializer=[AFJSONResponseSerializer serializer];
    [manager GET:url_topic parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self performSelectorOnMainThread:@selector(receiveData:) withObject:responseObject waitUntilDone:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"错误" message:[NSString stringWithFormat:@"网络错误"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }];
}
#pragma mark -Delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return topics.count;
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
    [cell initUIFromTopic:[topics objectAtIndex:indexPath.row]];
}


@end
