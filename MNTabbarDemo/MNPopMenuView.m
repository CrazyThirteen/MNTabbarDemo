//
//  MNPopMenuView.m
//  MNTabbarDemo
//
//  Created by 钱进 on 16/8/9.
//  Copyright © 2016年 钱进. All rights reserved.
//

#import "MNPopMenuView.h"
#import "MNPopMenuCell.h"

@interface MNPopMenuView () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, weak) UIButton *cover;

@end

@implementation MNPopMenuView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)showMenuViewindexPath:(NSIndexPath *)indexPath
{
    // 添加菜单整体到窗口身上
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIButton *cover = [[UIButton alloc] init];
    cover.backgroundColor = [UIColor clearColor];
    
    CGRect coverFrame = CGRectMake(0, 0, window.bounds.size.width, window.bounds.size.height-60);
    cover.frame = coverFrame;
    [cover addTarget:self action:@selector(tapBackGroudDismiss) forControlEvents:UIControlEventTouchUpInside];
    [window addSubview:cover];
    self.cover = cover;
    
    self.tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = NO;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.sectionFooterHeight = 5;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.tableView];
    
    [window addSubview:self];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
}

- (void)dismiss
{
    [UIView animateWithDuration:0.2 animations:^{
        
        self.alpha = 0;
        self.centerY = [UIScreen mainScreen].bounds.size.height - 60;
        
    } completion:^(BOOL finished) {
        [self.cover removeFromSuperview];
        [self removeFromSuperview];
    }];
}

#pragma mark -
#pragma mark UITableViewDelegate/UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.titleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *rowsData = self.titleArray[section];
    return rowsData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 1.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 38;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MNPopMenuCell *cell = [MNPopMenuCell cellWithTableView:tableView indexPath:indexPath];
    cell.contentBorderColor = UIColorFromRGB(0xcccccc);
    cell.contentBackgroundColor = [UIColor whiteColor];
    cell.contentBorderWidth = 1.0;
    cell.contentMargin = 2;
    cell.contentCornerRadius = CGSizeMake(5, 5);
    
    
    cell.titleLabel.text = self.titleArray[indexPath.section][indexPath.row];
    cell.titleLabel.highlightedTextColor = UIColorFromRGB(0x7dbf60);
    [cell.titleLabel sizeToFit];
    cell.titleImage.image = [UIImage imageNamed:self.titleImageArray[indexPath.section][indexPath.row]];
    NSString *highlightedImageName = [NSString stringWithFormat:@"%@_selected",self.titleImageArray[indexPath.section][indexPath.row]];
    cell.titleImage.highlightedImage = [UIImage imageNamed:highlightedImageName];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MNBaseBorderCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%@",cell.titleLabel.text);
    
    if ([self.delegate respondsToSelector:@selector(setSelectedRow:)]) {
        [self.delegate setSelectedRow:self.menuTypr];
    }
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSNumber *selRow = [[NSNumber alloc] initWithInteger:indexPath.row];
    NSNumber *selSection = [[NSNumber alloc] initWithInteger:indexPath.section];
    
    [user setObject:selRow forKey:@"selectedRow"];
    [user setObject:selSection forKey:@"selectedSection"];
    
    if ([cell.titleLabel.text isEqualToString:@"1-1"]) {
        NSNotification * notice = [NSNotification notificationWithName:MNFirstFirst object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notice];
    }else if ([cell.titleLabel.text isEqualToString:@"1-2"]){
        NSNotification * notice = [NSNotification notificationWithName:MNFirstSecond object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notice];
    }else if ([cell.titleLabel.text isEqualToString:@"1-3"]){
        NSNotification * notice = [NSNotification notificationWithName:MNFirstThird object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notice];
    }else if ([cell.titleLabel.text isEqualToString:@"1-4"]){
        NSNotification * notice = [NSNotification notificationWithName:MNFirstFouth object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notice];
    }else if ([cell.titleLabel.text isEqualToString:@"2-1"]){
        NSNotification * notice = [NSNotification notificationWithName:MNSecondFirst object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notice];
    }else if ([cell.titleLabel.text isEqualToString:@"2-2"]){
        NSNotification * notice = [NSNotification notificationWithName:MNSecondSecond object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notice];
    }else if ([cell.titleLabel.text isEqualToString:@"3-1"]){
        NSNotification * notice = [NSNotification notificationWithName:MNThirdFirst object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notice];
    }else if ([cell.titleLabel.text isEqualToString:@"3-2"]){
        NSNotification * notice = [NSNotification notificationWithName:MNThirdSecond object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notice];
    }else if ([cell.titleLabel.text isEqualToString:@"4-1"]){
        NSNotification * notice = [NSNotification notificationWithName:MNFouthFirst object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notice];
    }else if ([cell.titleLabel.text isEqualToString:@"4-2"]){
        NSNotification * notice = [NSNotification notificationWithName:MNFouthSecond object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notice];
    }else if ([cell.titleLabel.text isEqualToString:@"4-3"]){
        NSNotification * notice = [NSNotification notificationWithName:MNFouthThird object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notice];
    }else if ([cell.titleLabel.text isEqualToString:@"4-4"]){
        NSNotification * notice = [NSNotification notificationWithName:MNFouthFouth object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notice];
    }
    
    [self dismiss];
}
#pragma mark -
#pragma mark event pesponse
- (void)tapBackGroudDismiss
{
    if ([self.delegate respondsToSelector:@selector(setSelectedBtnLastTag)]) {
        [self.delegate setSelectedBtnLastTag];
    }
    
    [self dismiss];
}

#pragma mark -
#pragma mark getter && setter
- (NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = [NSArray array];
    }
    return _titleArray;
}

- (NSArray *)titleImageArray
{
    if (!_titleImageArray) {
        _titleImageArray = [NSArray array];
    }
    return _titleImageArray;
}
@end
