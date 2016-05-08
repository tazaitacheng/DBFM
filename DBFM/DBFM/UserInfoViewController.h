//
//  UserInfoViewController.h
//  DBFM
//
//  Created by lkjy on 16/5/8.
//  Copyright © 2016年 何健. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/UIKit+AFNetworking.h>
#import "LoginViewController.h"
#import "NetworkManager.h"
#import "AppDelegate.h"
#import "ProtocolClass.h"


@interface UserInfoViewController : UIViewController<DoubanDelegate,UIAlertViewDelegate>
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *logoutButton;
@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *loginImage;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *usernameLabel;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *playedLabel;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *likedLabel;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *bannedLabel;
- (IBAction)logoutButton:(id)sender;

-(void)setUserInfo;
-(void)logoutSuccess;
@end
