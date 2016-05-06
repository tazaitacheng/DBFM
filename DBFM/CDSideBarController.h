//
//  CDSideBarController.h
//  DBFM
//
//  Created by lkjy on 16/5/6.
//  Copyright © 2016年 何健. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol CDSideBarControllerDelegate <NSObject>

- (void)menuButtonClicked:(int)index;

@end

@interface CDSideBarController : NSObject
{
    UIView              *_backgroundMenuView;
    UIButton            *_menuButton;
    NSMutableArray      *_buttonList;
}


@property (nonatomic, retain) UIColor *menuColor;
@property (nonatomic) BOOL isOpen;

@property (nonatomic, weak) id<CDSideBarControllerDelegate> delegate;
+(CDSideBarController *)sharedInstanceWithImages:(NSArray*)images;
+(CDSideBarController *)sharedInstance;
- (CDSideBarController*)initWithImages:(NSArray*)buttonList;
- (void)insertMenuButtonOnView:(UIView*)view atPosition:(CGPoint)position;
- (void)dismissMenu;



@end
