//
//  LoginViewController.h
//  ZhiHu
//
//  Created by 严润发 on 15/8/3.
//  Copyright (c) 2015年 严润发. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *EmailTextLabel;

@property (weak, nonatomic) IBOutlet UITextField *PasswordTextLabel;

@property (copy,nonatomic) void (^reloadData)();

- (IBAction)loginButtonClicked:(id)sender;


@end
