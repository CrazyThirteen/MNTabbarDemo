//
//  MNTabBar.m
//  MNTabbarDemo
//
//  Created by 钱进 on 16/8/9.
//  Copyright © 2016年 钱进. All rights reserved.
//

#import "MNTabBar.h"
#import "MNTabBarButton.h"
#import "MNPopMenuView.h"

@interface MNTabBar () < PopMenuViewDelegate >
{
    NSInteger lastTag;
    NSArray * sizeArray;
}
@property (nonatomic, weak) MNTabBarButton * selectButton;
@property (nonatomic, strong) MNPopMenuView * popView;

@end

@implementation MNTabBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        lastTag = 99;
        sizeArray = @[@78.0,@39.0,@39.0,@78.0];
    }
    return self;
}

/**
 *  添加按钮
 *
 *  @param item item description
 */
- (void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    // 1 创建按钮
    MNTabBarButton * button = [[MNTabBarButton alloc]init];
    [self addSubview:button];
    //   添加按钮到数组中
    [self.tabBarButtons addObject:button];
    // 2 设置数据
    button.item = item;
    // 3 监听按钮点击事件
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    // 4 默认选中第0个按钮
    if (self.tabBarButtons.count == 1)
    {
        MNTabBarButton *button = self.tabBarButtons[0];
        button.selected = YES;
    }
}

#pragma mark -
#pragma mark event response
- (void)buttonClick:(MNTabBarButton *)button
{
    if (button.tag == lastTag) {
        return;
    }
    
    if ([self.popView superview])
    {
        [self.popView dismiss];
        lastTag = 99;
    }
    
    self.popView = [[MNPopMenuView alloc] init];
    self.popView.delegate = self;
    self.popView.centerX = button.centerX;
    
    if (button.tag  == 0) {
        self.popView.titleArray = @[@[@"1-1",@"1-2",@"1-3",@"1-4"]];
        self.popView.titleImageArray = @[@[@"article",@"video",@"audio",@"music"]];
        self.popView.centerY = [UIScreen mainScreen].bounds.size.height - self.frame.size.height - 10;
        self.popView.bounds = CGRectMake(0, 0, 100, 39*4);
        self.popView.menuTypr = button;
    }else if (button.tag == 1){
        self.popView.titleArray = @[@[@"2-1",@"2-2"]];
        self.popView.titleImageArray = @[@[@"commonquestion",@"myquestion"]];
        self.popView.centerY = [UIScreen mainScreen].bounds.size.height - self.frame.size.height - 10;
        self.popView.bounds = CGRectMake(0, 0, 100, 39*2);
        self.popView.menuTypr = button;
    }else if (button.tag == 2){
        self.popView.titleArray = @[@[@"3-1",@"3-2"]];
        self.popView.titleImageArray = @[@[@"faxun",@"pintaiactive"]];
        self.popView.centerY = [UIScreen mainScreen].bounds.size.height - self.frame.size.height - 10;
        self.popView.bounds = CGRectMake(0, 0, 100, 39*2);
        self.popView.menuTypr = button;
    }else if (button.tag == 3){
        self.popView.titleArray = @[@[@"4-1",@"4-2",@"4-3"],@[@"4-4"]];
        self.popView.titleImageArray = @[@[@"everywords",@"forum",@"collect"],@[@"setting"]];
        self.popView.centerY = [UIScreen mainScreen].bounds.size.height - self.frame.size.height - 10;
        self.popView.bounds = CGRectMake(0, 0, 100, 39*4+10);
        self.popView.menuTypr = button;
    }
    
    lastTag = button.tag;
    
    NSIndexPath *indexpath;
    if (button.tag == self.selectButton.tag)
    {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        NSNumber *selrow = [user objectForKey:@"selectedRow"];
        NSNumber *selsection = [user objectForKey:@"selectedSection"];
        NSInteger selRow = [selrow integerValue];
        NSInteger selSection = [selsection integerValue];
        indexpath = [NSIndexPath indexPathForRow:selRow inSection:selSection];
    }
    else
    {
        indexpath = nil;
    }
    
    [self.popView showMenuViewindexPath:indexpath];
    
    
    self.popView.alpha = 0;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.popView.alpha = 1;
        self.popView.centerY = [UIScreen mainScreen].bounds.size.height - self.frame.size.height - 10 - [sizeArray[button.tag] floatValue];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)setSelectedBtnLastTag
{
    lastTag = 99;
}

- (void)setSelectedRow:(MNTabBarButton *)button
{
    self.selectButton = button;
    lastTag = 99;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat h = self.frame.size.height;
    CGFloat w = self.frame.size.width - 40;
    
    CGFloat buttonH = h;
    CGFloat buttonW = w / self.subviews.count;
    CGFloat buttonY = 0;
    
    for (int i = 0; i < self.tabBarButtons.count; i++)
    {
        // 1 取出按钮
        UIButton *button = self.tabBarButtons[i];
        
        // 2 设置按钮的frame
        CGFloat buttonX = i * buttonW + 20;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 3 绑定tag
        button.tag = i;
    }
}

- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize sized = [super sizeThatFits:size];
    sized.height = 60.0;
    
    return sized;
}

- (NSMutableArray *)tabBarButtons{
    if (!_tabBarButtons) {
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
