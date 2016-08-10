//
//  MNTabBarController.m
//  MNTabbarDemo
//
//  Created by 钱进 on 16/8/8.
//  Copyright © 2016年 钱进. All rights reserved.
//

#import "MNTabBarController.h"
#import "MNTabBar.h"
#import "MNNavigationController.h"
#import "MNTabBarButton.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

@interface MNTabBarController () < MNTabBarDelegate>

@property (nonatomic, strong) MNTabBar * customTabBar;

@end

@implementation MNTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTabBar];
    
    [self setupAllChildViewControllers];
    
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(ChangeCurrentController:) name:MNFirstFirst object:nil];
    [center addObserver:self selector:@selector(ChangeCurrentController:) name:MNFirstSecond object:nil];
    [center addObserver:self selector:@selector(ChangeCurrentController:) name:MNFirstThird object:nil];
    [center addObserver:self selector:@selector(ChangeCurrentController:) name:MNFirstFouth object:nil];
    
    [center addObserver:self selector:@selector(ChangeCurrentController:) name:MNSecondFirst object:nil];
    [center addObserver:self selector:@selector(ChangeCurrentController:) name:MNSecondSecond object:nil];
    
    [center addObserver:self selector:@selector(ChangeCurrentController:) name:MNThirdFirst object:nil];
    [center addObserver:self selector:@selector(ChangeCurrentController:) name:MNThirdSecond object:nil];
    
    [center addObserver:self selector:@selector(ChangeCurrentController:) name:MNFouthFirst object:nil];
    [center addObserver:self selector:@selector(ChangeCurrentController:) name:MNFouthSecond object:nil];
    [center addObserver:self selector:@selector(ChangeCurrentController:) name:MNFouthThird object:nil];
    [center addObserver:self selector:@selector(ChangeCurrentController:) name:MNFouthFouth object:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (UIView *child in self.tabBar.subviews)
    {
        if ([child isKindOfClass:[UIControl class]])
        {
            [child removeFromSuperview];
        }
    }
}

- (void)viewWillLayoutSubviews{
    CGRect tabFrame = self.tabBar.frame; //self.TabBar is IBOutlet of your TabBar
    tabFrame.size.height = 60;
    tabFrame.origin.y = self.view.frame.size.height - 60;
    self.tabBar.frame = tabFrame;
}

- (void)setupTabBar
{
    MNTabBar *customTabBar = [[MNTabBar alloc] init];
    //    customTabBar.frame = self.tabBar.bounds;
    customTabBar.frame = CGRectMake(0, 0, self.tabBar.width, 60);
    customTabBar.backgroundColor = [UIColor whiteColor];
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}

#pragma mark -
#pragma mark 通知方法
- (void)ChangeCurrentController:(NSNotification *)sender
{
    if ([sender.name isEqualToString:MNFirstFirst] ||
        [sender.name isEqualToString:MNFirstSecond] ||
        [sender.name isEqualToString:MNFirstThird] ||
        [sender.name isEqualToString:MNFirstFouth])
    {
        self.selectedIndex = 0;
        for (MNTabBarButton *btn in self.customTabBar.tabBarButtons)
        {
            if (btn.tag == 0)
            {
                btn.selected = YES;
            }
            else
            {
                btn.selected = NO;
            }
        }
    }
    else if ([sender.name isEqualToString:MNSecondFirst] ||
             [sender.name isEqualToString:MNSecondSecond])
    {
        self.selectedIndex = 1;
        for (MNTabBarButton *btn in self.customTabBar.tabBarButtons)
        {
            if (btn.tag == 1)
            {
                btn.selected = YES;
            }
            else
            {
                btn.selected = NO;
            }
        }
    }
    else if ([sender.name isEqualToString:MNThirdFirst] ||
             [sender.name isEqualToString:MNThirdSecond])
    {
        self.selectedIndex = 2;
        for (MNTabBarButton *btn in self.customTabBar.tabBarButtons)
        {
            if (btn.tag == 2)
            {
                btn.selected = YES;
            }
            else
            {
                btn.selected = NO;
            }
        }
    }
    else if([sender.name isEqualToString:MNFouthFirst] ||
            [sender.name isEqualToString:MNFouthSecond] ||
            [sender.name isEqualToString:MNFouthThird] ||
            [sender.name isEqualToString:MNFouthFouth])
    {
        self.selectedIndex = 3;
        for (MNTabBarButton *btn in self.customTabBar.tabBarButtons)
        {
            if (btn.tag == 3)
            {
                btn.selected = YES;
            }
            else
            {
                btn.selected = NO;
            }
        }
    }
    
    
}

- (void)setupAllChildViewControllers
{
    FirstViewController * firstViewController = [[FirstViewController alloc] init];
    [self setupChildViewController:firstViewController title:@"First" imageName:@"tabbar_buddhastudy" selectImageName:@"tabbar_buddhastudy_selected"];
    
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    [self setupChildViewController:secondViewController title:@"Second" imageName:@"tabbar_lifeanswer" selectImageName:@"tabbar_lifeanswer_selected"];
    
    ThirdViewController *thirdViewController = [[ThirdViewController alloc] init];
    [self setupChildViewController:thirdViewController title:@"Third" imageName:@"tabbar_activitynotice" selectImageName:@"tabbar_activitynotice_selected"];
    
    FourthViewController *fourthViewController = [[FourthViewController alloc] init];
    [self setupChildViewController:fourthViewController title:@"Fourth" imageName:@"tabbar_other" selectImageName:@"tabbar_other_selected"];
    
}
/**
 *  初始化一个子控制器
 *
 *  @param childVC         需要初始化的子控制器
 *  @param title           标题
 *  @param imageName       图标
 *  @param selectImageName 选中的图标
 */
- (void)setupChildViewController:(UIViewController *)childVC title:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName
{
    // 设置控制器的属性
    childVC.title = title;
    // 设置图标
    childVC.tabBarItem.image = [UIImage imageNamed:imageName];
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectImageName];
    childVC.tabBarItem.selectedImage = selectedImage;
    
    // 导航控制器
    MNNavigationController *nav = [[MNNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
    
    // 添加tabbar内部按钮
    [self.customTabBar addTabBarButtonWithItem:childVC.tabBarItem];
}
@end
