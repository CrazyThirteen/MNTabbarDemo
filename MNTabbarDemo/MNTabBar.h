//
//  MNTabBar.h
//  MNTabbarDemo
//
//  Created by 钱进 on 16/8/9.
//  Copyright © 2016年 钱进. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MNTabBar;

@protocol MNTabBarDelegate <NSObject>
@optional
- (void)tabBar:(MNTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;
@end

@interface MNTabBar : UIView
@property (nonatomic, strong)NSMutableArray * tabBarButtons;
@property (nonatomic, weak) id <MNTabBarDelegate> delegate;

- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@end
