//
//  LoginViewController.m
//  DBFM
//
//  Created by lkjy on 16/5/8.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "LoginViewController.h"
#import "NetworkManager.h"
#import <UIImageView+AFNetworking.h>

@interface LoginViewController ()
{
    NSMutableString* captchaID;
    NetworkManager* networkManager;
    AppDelegate* appDelegate;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    appDelegate = [UIApplication sharedApplication].delegate;
    // Do any additional setup after loading the view from its nib.
    networkManager = [[NetworkManager alloc]init];
    networkManager.delegate = (id)self;
    //初始化图片点击事件
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loadCaptchaImage)];
    [singleTap setNumberOfTapsRequired:1];
    self.captchaImageview.userInteractionEnabled = YES;
    [self.captchaImageview addGestureRecognizer:singleTap];

}

-(void)viewWillAppear:(BOOL)animated
{
    [self viewWillAppear:animated];
}

-(void)setCaptchaImageWithURLInString:(NSString *)url
{
    [self.captchaImageview setImageWithURL:[NSURL URLWithString:url]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)submitButtonTapped:(UIButton *)sender
{
    NSString *username = _username.text;
    NSString *password = _password.text;
    NSString *captcha = _captcha.text;
    [networkManager LoginwithUsername:username Password:password Captcha:captcha RememberOnorOff:@"off"];

}

- (IBAction)cancelButtonTapped:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//验证码图片点击刷新验证码事件
-(void)loadCaptchaImage
{
    [networkManager loadCaptchaImage];
}

-(void)loginSuccess
{
    [_delegate setUserInfo];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
