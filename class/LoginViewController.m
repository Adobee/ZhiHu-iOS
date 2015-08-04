//
//  LoginViewController.m
//  ZhiHu
//
//  Created by 严润发 on 15/8/3.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import "LoginViewController.h"
#import "AFNetworking.h"
#import "conf.h"
#include "TabBarController.h"



@implementation LoginViewController

- (IBAction)loginButtonClicked:(id)sender {
    [self loginRequest];
}

- (void)receiveData:(NSData *)data{
    NSDictionary *dict=(NSDictionary *)data;
    if ([dict[@"msg"] isEqual:@"登陆成功"]) {
        NSLog(@"登陆成功");
        if (_reloadData) {
            self.reloadData();
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        
    }
}

- (void)loginRequest{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFJSONResponseSerializer serializer];
    manager.requestSerializer=[AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setValue:@"Mozolla/5.0 (X11; Ubuntu; Linux x86_64; rv:34.0 Gecko/20100101 Firefox/34.0" forHTTPHeaderField:@"User-Agent"];
    [manager.requestSerializer setValue:@"www.zhihu.com" forHTTPHeaderField:@"Host"];
    [manager.requestSerializer setValue:@"http://www.zhihu.com" forHTTPHeaderField:@"Referer"];
    //[manager.requestSerializer setValue:@"XMLHttpRequest" forHTTPHeaderField:@"X-Requested-With"];
    
    NSDictionary *parameters=@{@"email":_EmailTextLabel.text,@"password":_PasswordTextLabel.text};
    [manager POST:url_login parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self performSelectorOnMainThread:@selector(receiveData:) withObject:responseObject waitUntilDone:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"错误" message:[NSString stringWithFormat:@"网络错误"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }];

}
@end
