//
//  LoginViewController.h
//  DBFM
//
//  Created by lkjy on 16/5/8.
//  Copyright © 2016年 何健. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
#import "NetworkManager.h"
#import "AppDelegate.h"
#import "ProtocolClass.h"


@interface LoginViewController : UIViewController<DoubanDelegate>
@property (weak, nonatomic)id<DoubanDelegate>delegate;


@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *captchaImageview;
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *username;
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *password;
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *captcha;
- (IBAction)submitButtonTapped:(UIButton *)sender;
- (IBAction)cancelButtonTapped:(UIButton *)sender;

@end
