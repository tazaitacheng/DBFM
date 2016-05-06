//
//  PlayerController.m
//  DoubanFM
//
//  Created by lkjy on 16/5/5.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "PlayerController.h"
#import "SongInfo.h"

@interface PlayerController ()
{
    AppDelegate* appDelegate;
    NetworkManager* networkManager;
}

@end


@implementation PlayerController

-(instancetype)init
{
    if (self = [super init])
    {
        appDelegate = [[UIApplication sharedApplication]delegate];
        networkManager = [[NetworkManager alloc]init];
    }
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(startPlay) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(initSongInfomation) name:MPMoviePlayerLoadStateDidChangeNotification object:nil];
    
    return self;
}

/*
 dispatch_once是线程安全的，即使在多个线程中同时调用，也只有一个块被执行，其它dispatch_once块的调用被阻塞，直到执行的那个块运行结束，所以在整个程序运行周期内，dispatch_once块只会运行一次，可以确定，下一行代码执行前，整个dispatch_once块是执行完毕的，不管当前工作线程是哪个。如果已执行，dispatch_once会被快速跳过，在类似循环体中调用这种场合，也无需担心执行它的额外性能开销。如果一个程序包含多个同一调用类的实例，只有其中一个实例会执行dispatch_once块
 */
+(instancetype)sharedInstance
{
    static PlayerController* sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc]init];
    });
    
    return sharedInstance;
}

//初始化歌曲信息
-(void)initSongInfomation{
    [self.songInfoDelegate initSongInfomation];
}

#pragma mark --- 实现方法 startPlay

-(void)startPlay
{
    /*
     try
     {
     执行的代码，其中可能有异常。一旦发现异常，则立即跳到catch执行。否则不会执行catch里面的内容
     }
     
     catch
     {
     除非try里面执行代码发生了异常，否则这里的代码不会执行
     }
     
     finally
     {
     不管什么情况都会执行，包括try catch 里面用了return ,可以理解为只要执行了try或者catch，就一定会执行 finally
     }
     */
    @try {
        if ([SongInfo currentSongIndex] >= ((int)[[PlayerController sharedInstance].playList.song count]-1))
        {
            [networkManager loadPlaylistwithType:@"p"];//“p”正在使用一个播放列表
        }
        else
        {
            [SongInfo setCurrentSongIndex:[SongInfo currentSongIndex] + 1];
            [SongInfo setCurrentSong:[[PlayerController sharedInstance].playList.song objectAtIndex:[SongInfo currentSongIndex]]];
            
            [self setContentURL:[NSURL URLWithString:[[SongInfo currentSong] valueForKey:@"url"]]];
            [self play];
        }
    }
    @catch (NSException *exception) {
        
    }
    //    @finally {
    //        <#Code that gets executed whether or not an exception is thrown#>
    //    }
}

#pragma mark --- PlayButtonTask //播放按钮的任务

//点击下一曲,按照豆瓣算法，需要重新载入播放列表
//获取播放列表信息
//type
//n : None. Used for get a song list only.
//e : Ended a song normally.
//u : Unlike a hearted song.
//r : Like a song.
//s : Skip a song.
//b : Trash a song.
//p : Use to get a song list when the song in playlist was all played.
//sid : the song's id


//暂停
-(void)pauseSong
{
    [self pause];
}
//暂停后开始
-(void)restartSong
{
    [self play];
}
//标记为喜欢
-(void)likeSong
{
    [networkManager loadPlaylistwithType:@"r"];//"r"表示喜欢该首歌
}
//取消喜欢
-(void)dislikesong
{
    [networkManager loadPlaylistwithType:@"u"];//“u”不喜欢该首歌
}
//删除该首歌
-(void)deleteSong
{
    [networkManager loadPlaylistwithType:@"b"];//“b”删除该首歌
}
//下一首
-(void)skipSong
{
    [networkManager loadPlaylistwithType:@"s"];//“s”下一首
}


@end
