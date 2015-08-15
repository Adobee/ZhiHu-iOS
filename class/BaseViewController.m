//
//  BaseViewController.m
//  ZhiHu
//
//  Created by 严润发 on 15/8/15.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import "BaseViewController.h"
#import "LoginViewController.h"
#import "BaseTableViewCell.h"
#import "AFNetworking.h"
#import "HTMLAnalyzer.h"
#import "MBProgressHUD.h"
#import "UIScrollView+SVPullToRefresh.h"


@implementation BaseViewController{
    NSMutableArray *contents;
    MBProgressHUD *hud;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    contents=[[NSMutableArray alloc]init];
    hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        [self initData];
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initUI{
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    //self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
    //    [self initData];
    //}];
    [_tableView addPullToRefreshWithActionHandler:^{
        [self initData];
    }];
}

-(void)receiveData:(NSData *)data{
    NSString *revevieData=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    if ([revevieData rangeOfString:@"<input id=\"captcha\" name=\"captcha\" placeholder=\"验证码\" required>"].length>0) {
        [self performSegueWithIdentifier:@"LoginSegue" sender:self];
    }
    else{
        contents=[HTMLAnalyzer Analysis:revevieData WithIdentifier:_identifier];
        [self initUI];
    }
    if ([_tableView.pullToRefreshView state]==SVPullToRefreshStateLoading) {
        [_tableView.pullToRefreshView stopAnimating];
        [_tableView reloadData];
    }
}


-(void)initData{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.requestSerializer=[AFHTTPRequestSerializer serializer];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manager GET:_url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self receiveData:responseObject];

        });
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"错误" message:[NSString stringWithFormat:@"网络错误"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }];
}


#pragma mark -Delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return contents.count;
}

-(BaseTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:_identifier];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:_identifier bundle:nil] forCellReuseIdentifier:_identifier];
        cell=[tableView dequeueReusableCellWithIdentifier:_identifier];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(BaseTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    [cell initUIFromContent:[contents objectAtIndex:indexPath.row]];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"LoginSegue"]) {
        LoginViewController *loginViewController=segue.destinationViewController;
        loginViewController.reloadData=^(){
            [self initData];
        };
    }
}



@end
