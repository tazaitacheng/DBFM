//
//  ProtocolClass.h
//  DBFM
//
//  Created by lkjy on 16/5/6.
//  Copyright © 2016年 何健. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol DoubanDelegate <NSObject>
@optional
/**
 *  登陆界面
 */
-(void)setCaptchaImageWithURLInString:(NSString *)url;

-(void)loginSuccess;
-(void)logoutSuccess;

/**
 *  播放列表
 */
-(void)reloadTableviewData;

/**
 *  初始化歌曲
 */
-(void)initSongInfomation;

/**
 *  初始化用户信息
 */
-(void)setUserInfo;

-(void)menuButtonClicked:(int)index;
@end

@interface ProtocolClass : NSObject

@end
