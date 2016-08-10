//
//  MNTabBarButton.m
//  MNTabbarDemo
//
//  Created by 钱进 on 16/8/9.
//  Copyright © 2016年 钱进. All rights reserved.
//

#import "MNTabBarButton.h"

static const CGFloat MNTabBarButtonImageRatio = 0.4f;

@implementation MNTabBarButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 居中
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = YES;
        // 大小
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        // 颜色
        [self setTitleColor:UIColorFromRGB(0xcccccc) forState:UIControlStateNormal];
        [self setTitleColor:UIColorFromRGB(0x7dbf60) forState:UIControlStateSelected];
    }
    return self;
}

/**
 *  内部图片的frame
 *
 *  @param contentRect contentRect description
 *
 *  @return return value description
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = self.width;
    CGFloat imageH = self.height * MNTabBarButtonImageRatio;
    return CGRectMake(0, 6, imageW, imageH);
}

/**
 *  内部文字的frame
 *
 *  @param contentRect contentRect description
 *
 *  @return return value description
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = self.height * MNTabBarButtonImageRatio;
    CGFloat titleW = self.width;
    CGFloat titleH = self.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

/**
 *  setter
 *
 *  @param item item description
 */
- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    // 文字
    [self setTitle:item.title forState:UIControlStateNormal];
    // 图标
    [self setImage:item.image forState:UIControlStateNormal];
    // 选中的图标
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    
    // self监听item的4个属性值的改变
    [item addObserver:self forKeyPath:MNTabBarTitle options:0 context:nil];
    [item addObserver:self forKeyPath:MNTabBarImage options:0 context:nil];
    [item addObserver:self forKeyPath:MNTabBarSelectedImage options:0 context:nil];
}

/**
 *  一定要移除监听器
 */
- (void)dealloc
{
    [self.item removeObserver:self forKeyPath:MNTabBarTitle];
    [self.item removeObserver:self forKeyPath:MNTabBarImage];
    [self.item removeObserver:self forKeyPath:MNTabBarSelectedImage];
}

/**
 *  当KVO监听到某个对象的属性改变时 调用
 *
 *  @param keyPath 被改变的属性的名称
 *  @param object  被监听的那个对象
 *  @param change  存放者被改变属性的值
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    // 2.设置按钮的文字
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setTitle:self.item.title forState:UIControlStateSelected];
    
    // 3.设置图片
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
}






@end
