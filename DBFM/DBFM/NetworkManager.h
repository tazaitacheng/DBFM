//
//  NetworkManager.h
//  DBFM
//
//  Created by lkjy on 16/5/6.
//  Copyright © 2016年 何健. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProtocolClass.h"

@interface NetworkManager : NSObject

@property(nonatomic,weak)id<DoubanDelegate>delegate;
@property(nonatomic)NSMutableString* captchaID;//验证码

+(instancetype)sharedInstancd;//共享

-(instancetype)init;

-(void)setChannel:(NSUInteger)channelIndex withURLWithString:(NSString *)urlWithString;//下载该频道

-(void)LoginwithUsername:(NSString *)username Password:(NSString *)password Captcha:(NSString *)captcha RememberOnorOff:(NSString *)rememberOnorOff;//用户登录时的信息

-(void)logout;//注销

-(void)loadCaptchaImage;//下载验证码图片

-(void)loadPlaylistwithType:(NSString *)type;//下载播放列表

@end
