//
//  MNPopMenuCell.m
//  MNTabbarDemo
//
//  Created by 钱进 on 16/8/9.
//  Copyright © 2016年 钱进. All rights reserved.
//

#import "MNPopMenuCell.h"

@implementation MNPopMenuCell

+ (instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    static NSString * cellId = @"cellId";
    MNPopMenuCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[MNPopMenuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    /**
     *  一定要这里设置style，而不能在上面的判断里面，因为cell重用的时候，只要有不同的地方都应该重新设置，否则拿到cell的style就是上一个的样式而自己却没有进行修改
     */
    if (indexPath.row == 0 && indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
        cell.borderStyle = BaseCellBorderStyleAllRound;
    }else if (indexPath.row == 0) {
        cell.borderStyle = BaseCellBorderStyleTopRound;
    }else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
        cell.borderStyle = BaseCellBorderStyleBottomRound;
    }else {
        cell.borderStyle = BaseCellBorderStyleNoRound;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //配置默认值
        self.contentBorderColor = [UIColor lightGrayColor];
        self.contentBackgroundColor = [UIColor whiteColor];
        self.contentBorderWidth = 2.0;
        self.contentMargin = 10.0;
        self.contentCornerRadius = CGSizeMake(5, 5);
        
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor clearColor];
        self.selectedBackgroundView = view;
        
        UIImageView *cellImage = [[UIImageView alloc] initWithFrame:CGRectMake(11, 12, 16, 16)];
        [self.contentView addSubview:cellImage];
        self.titleImage = cellImage;
        
        UILabel *textLabel = [[UILabel alloc] init];
        textLabel.font = [UIFont systemFontOfSize:12];
        textLabel.textColor = UIColorFromRGB(0xcccccc);
        textLabel.y = 13;
        textLabel.x = 10 + 16 + 13;
        [self.contentView addSubview:textLabel];
        self.titleLabel = textLabel;
    }
    return self;
}
@end
