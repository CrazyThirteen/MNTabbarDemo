//
//  MNPopMenuView.h
//  MNTabbarDemo
//
//  Created by 钱进 on 16/8/9.
//  Copyright © 2016年 钱进. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MNTabBarButton;

@protocol PopMenuViewDelegate <NSObject>
@optional
- (void)setSelectedRow:(MNTabBarButton *)button;
- (void)setSelectedBtnLastTag;
@end

@interface MNPopMenuView : UIView

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *titleImageArray;
@property (nonatomic, strong) MNTabBarButton *menuTypr;
@property (nonatomic, weak) id <PopMenuViewDelegate> delegate;

- (void)dismiss;
- (void)showMenuViewindexPath:(NSIndexPath *)indexPath;

@end
