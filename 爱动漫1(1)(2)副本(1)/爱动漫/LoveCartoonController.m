//
//  LoveCartoonController.m
//  爱动漫
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "LoveCartoonController.h"
#import "LoveCartoonCell.h"
#import "DatailController.h"
#import "DataManager.h"
#import "LoveCartoon.h"
#import "FirstTopic.h"
#import "MJRefresh.h"



@interface LoveCartoonController ()

@end

@implementation LoveCartoonController

static NSString *indentifier = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"LoveCartoonCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:indentifier];
//    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:150/255.0 green:138/255.0 blue:233/255.0 alpha:1.0];
    
    UIImage *backgroundImage = [UIImage imageNamed:@"launch_tag.png"];
    [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    MJRefreshStateHeader *header = [MJRefreshStateHeader headerWithRefreshingTarget:self refreshingAction:@selector(load)];
    
    self.tableView.mj_header = header;
    
    [header setTitle:@"" forState:MJRefreshStateIdle];
    
    [header setTitle:@"即将刷新" forState:MJRefreshStatePulling];
    
    [header setTitle:@"正在刷新" forState: MJRefreshStateRefreshing];
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    self.tableView.mj_footer = footer;
    [footer setTitle:@"" forState:MJRefreshStateIdle];
    [footer setTitle:@"即将加载" forState:MJRefreshStatePulling];
    [footer setTitle:@"正在加载" forState:MJRefreshStateRefreshing];
    
    
    [DataManager sharedManager].reloadBlock = ^(){
        
        [self.tableView reloadData];
    };
    }
-(void)load{
    
    NSLog(@"猜猜我执行了没");
    [DataManager sharedManager].reloadBlock = ^(){
        
        [self.tableView reloadData];
    };
    [self.tableView.mj_header endRefreshing];
    
}

-(void)loadMoreData{
    
     [self.tableView.mj_footer endRefreshing];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [DataManager sharedManager].dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LoveCartoonCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier forIndexPath:indexPath];
    LoveCartoon *loveCN =[[DataManager sharedManager]loveCartoonWithIndex:indexPath.row];
    FirstTopic *first = [[DataManager sharedManager]firstTopicWithIndex:indexPath.row];
    cell.firstTopic = first;
    cell.loveCartoon = loveCN;
    cell.selectionStyle =  UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DatailController *datailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"datail"];
    UINavigationController *datailNC = [[UINavigationController alloc] initWithRootViewController:datailVC];
    LoveCartoon *cartoon = [[DataManager sharedManager] loveCartoonWithIndex:indexPath.row];
    datailVC.datailID = cartoon.ID;
    NSLog(@"datailVC.datailID == %@",datailVC.datailID);
    
    [self showDetailViewController:datailNC sender:nil];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 220;
    
}



@end
