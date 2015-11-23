//
//  FindController.m
//  爱动漫
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "FindController.h"
#import "FindCell.h"
#import "SDCycleScrollView.h"
#import "FindManager.h"
#import "AFNetworking.h"
#import "FindDatailController.h"
#import "Group.h"
#import "Topic.h"
#import "Comic.h"


@interface FindController ()<SDCycleScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,ClickImageViewDelegate>


@property (nonatomic, strong) Group *group;
@property (nonatomic, strong) NSIndexPath *indexPath;
@end
static NSString *indent = @"cell1";
@implementation FindController

- (void)viewDidLoad {
    [super viewDidLoad];
   [self.tableView registerNib:[UINib nibWithNibName:@"FindCell" bundle:nil] forCellReuseIdentifier:indent];
    [FindManager sharedFindManager].callBack = ^(){
        [self.tableView reloadData];
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [FindManager sharedFindManager].dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    FindCell *cell = [tableView dequeueReusableCellWithIdentifier:indent forIndexPath:indexPath];
    if (indexPath.row == 3) {
        return cell;
    }else{
    Group *group = [[FindManager sharedFindManager].dataArray objectAtIndex:indexPath.row];
    cell.group = group;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 3) {
        return 0;
    }else{
        return 200;
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableArray *array1 =[NSMutableArray array];
    [manager GET:@"http://api.kuaikanmanhua.com/v1/banners" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary:responseObject];
        NSDictionary *dic1 = dic[@"data"];
        NSMutableArray *array = dic1[@"banner_group"];
        for (NSDictionary *dic2 in array) {
            [array1 addObject:dic2[@"pic"]];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error :%@",error);
    }];
    
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0,self.view.frame.size.width , 200) imageURLStringsGroup:nil]; // 模拟网络延时情景
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.delegate = self;
    cycleScrollView2.dotColor = [UIColor yellowColor]; // 自定义分页控件小圆标颜色
    cycleScrollView2.placeholderImage = [UIImage imageNamed:@"placeholder"];
    [self.view addSubview:cycleScrollView2];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        cycleScrollView2.imageURLStringsGroup = array1;
    });
    return cycleScrollView2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 200;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.indexPath = indexPath;
}

-(void)clickImageViewOfCollectionView:(UICollectionView *)collectionView index:(NSIndexPath *)index{
    
    FindDatailController *findDatailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"finddatail"];
    
    self.group = [[FindManager sharedFindManager].dataArray objectAtIndex:self.indexPath.row];
    
    if (self.indexPath.row == 3) {
        Comic *comic = self.group.comicArray[index.row];
    }else{
        Topic *topic = self.group.topicsArray[index.row];
        findDatailVC.datailID = topic.theID;
    }
//    NSLog(@" =============== %ld",self.group.topicsArray.count);
    
    [self.navigationController pushViewController:findDatailVC animated:YES];
}
@end
