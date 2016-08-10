//
//  FirstViewController.m
//  MNTabbarDemo
//
//  Created by 钱进 on 16/8/10.
//  Copyright © 2016年 钱进. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
        [center addObserver:self selector:@selector(ChangeToFirstView) name:MNFirstFirst object:nil];
        [center addObserver:self selector:@selector(ChangeToSecondView) name:MNFirstSecond object:nil];
        [center addObserver:self selector:@selector(ChangeToThirdView) name:MNFirstThird object:nil];
        [center addObserver:self selector:@selector(ChangeToFourthView) name:MNFirstFouth object:nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)ChangeToFirstView{
    self.title = @"QJMNFirstFirst";
    self.view.backgroundColor = [UIColor darkGrayColor];
}

- (void)ChangeToSecondView{
    self.title = @"MNFirstSecond";
    self.view.backgroundColor = [UIColor grayColor];
//    self.ListURL = GetVideoList_URL;
//    self.pageIndex = @0;
//    
//    [self.parameters removeAllObjects];
//    [self.parameters setObject:self.pageIndex forKey:@"pageIndex"];
//    
//    [self.tableView.mj_header beginRefreshing];
}

- (void)ChangeToThirdView{
    self.title = @"QJMNFirstThird";
    self.view.backgroundColor = [UIColor darkTextColor];

//    self.ListURL = GetAudioList_URL;
//    self.pageIndex = @0;
//    
//    [self.parameters removeAllObjects];
//    [self.parameters setObject:@1 forKey:@"category"];
//    [self.parameters setObject:self.pageIndex forKey:@"pageIndex"];
//    
//    [self.tableView.mj_header beginRefreshing];
}

- (void)ChangeToFourthView{
    self.title = @"QJMNFirstFouth";
    self.view.backgroundColor = [UIColor lightGrayColor];

//    self.ListURL = GetAudioList_URL;
//    self.pageIndex = @0;
//    
//    [self.parameters removeAllObjects];
//    [self.parameters setObject:@2 forKey:@"category"];
//    [self.parameters setObject:self.pageIndex forKey:@"pageIndex"];
//    
//    [self.tableView.mj_header beginRefreshing];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
