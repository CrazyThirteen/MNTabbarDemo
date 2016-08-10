//
//  MNBaseBorderCell.h
//  MNTabbarDemo
//
//  Created by 钱进 on 16/8/9.
//  Copyright © 2016年 钱进. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  此cell负责简单的border配置，cell中的内容可以继承于此类再进行封装
 */

typedef NS_ENUM(NSUInteger, BaseCellBorderStyle) {
    BaseCellBorderStyleNoRound = 0,
    BaseCellBorderStyleTopRound,
    BaseCellBorderStyleBottomRound,
    BaseCellBorderStyleAllRound,
};

@interface MNBaseBorderCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *titleImage;
// 边框类型
@property (nonatomic, assign) BaseCellBorderStyle borderStyle;
// 边框颜色
@property (nonatomic, strong) UIColor *contentBorderColor;
// 边框内部内容颜色
@property (nonatomic, strong) UIColor *contentBackgroundColor;
// 边框的宽度 宽度的一半会延伸到外部
@property (nonatomic, assign) CGFloat contentBorderWidth;
// 左右距离父视图的边距
@property (nonatomic, assign) CGFloat contentMargin;
// 边框的圆角
@property (nonatomic, assign) CGSize contentCornerRadius;

/**
 *  初始化cell
 *
 *  @param tableView tableView description
 *  @param indexPath indexPath description
 *
 *  @return return value description
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

/**
 *  如果不想用上面的方法初始化cell，就用下面的方法设置borderStyle
 *
 *  @param tableView tableView description
 *  @param indexPath indexPath description
 */
- (void)setBorderStyleWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@end
