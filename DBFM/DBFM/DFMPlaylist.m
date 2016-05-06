//
//  DFMPlaylist.m
//  DBFM
//
//  Created by lkjy on 16/5/6.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "DFMPlaylist.h"
#import "SongInfo.h"

@implementation DFMPlaylist

+ (NSDictionary *)objectClassInArray
{
    return @{
             @"song" : NSStringFromClass([SongInfo class]),
             };
}

@end
