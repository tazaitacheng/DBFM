//
//  SongInfo.m
//  DBFM
//
//  Created by lkjy on 16/5/6.
//  Copyright © 2016年 何健. All rights reserved.
//


#import "SongInfo.h"

static SongInfo *currentSong;
static int currentSongIndex;

@implementation SongInfo

+ (instancetype)currentSong{
    if (!currentSong) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            currentSong = [[SongInfo alloc] init];
        });
    }
    return currentSong;
}

+ (void)setCurrentSong:(SongInfo *)songInfo
{
    currentSong = songInfo;
}

+ (NSInteger)currentSongIndex{
    return currentSongIndex;
}

+ (void)setCurrentSongIndex:(int)songIndex{
    currentSongIndex = songIndex;
}
@end
