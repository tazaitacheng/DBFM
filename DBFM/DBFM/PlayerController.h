//
//  PlayerController.h
//  DBFM
//
//  Created by lkjy on 16/5/6.
//  Copyright © 2016年 何健. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "AppDelegate.h"
#import "NetworkManager.h"
#import "ProtocolClass.h"
#import <MediaPlayer/MPMoviePlayerController.h>
#import "DFMPlaylist.h"

@interface PlayerController : MPMoviePlayerController
@property id<DoubanDelegate> songInfoDelegate;

@property (nonatomic) DFMPlaylist *playList;

+ (instancetype)sharedInstance;

-(instancetype)init;
-(void)startPlay;

//播放操作
-(void)pauseSong;
-(void)restartSong;
-(void)likeSong;
-(void)dislikesong;
-(void)deleteSong;
-(void)skipSong;
@end
