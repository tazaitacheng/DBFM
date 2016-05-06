//
//  DFMHotChannelsEntity.m
//  DBFM
//
//  Created by lkjy on 16/5/6.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "DFMHotChannelsEntity.h"
#import "ChannelInfo.h"

@implementation DFMHotChannelsEntity

+ (NSDictionary *)objectClassInArray
{
    return @{
             @"channels" : NSStringFromClass([ChannelInfo class]),
             };
}

@end
