//
//  FindDatailController.m
//  爱动漫
//
//  Created by lanou3g on 15/11/21.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "FindDatailController.h"
#import "AFNetworking.h"
#import "Chapter.h"
#import "ChapterCell.h"
#import "UIImageView+WebCache.h"
#import "Comics.h"
#import "TopicController.h"
#import "lastCartoon.h"

@interface FindDatailController ()

@property(nonatomic,strong)NSMutableArray *dataArray;

@property (nonatomic, strong) Chapter *chapter;

@end

@implementation FindDatailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.tableView registerClass:[ChapterCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ChapterCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    UIImage *backgroundImage = [UIImage imageNamed:@"launch_tag.png"];
    [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    

    
    [self result];
}

-(void)result{

    
    NSString *urlStr = [NSString stringWithFormat:@"http://api.kuaikanmanhua.com/v1/topics/%@?sort=0",self.datailID];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:conf];
    
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        //解析数据
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        self.dataArray = [NSMutableArray arrayWithCapacity:20];
        NSDictionary *dic = [rootDic objectForKey:@"data"];
        NSArray *array = [NSArray arrayWithObject:dic];
        for (NSDictionary *dic in array) {
            self.chapter = [Chapter new];
            [self.chapter setValuesForKeysWithDictionary:dic];
            self.dataArray = [NSMutableArray arrayWithArray:self.chapter.comicsArray];
            NSLog(@"解析完成 %lu", (unsigned long)self.chapter.comicsArray.count);

        }
        [self.tableView reloadData];
    }];
    [dataTask resume];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"------ %ld",self.dataArray.count);
    return self.dataArray.count;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChapterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Comics *comics = self.dataArray[indexPath.row];
    cell.chapter4LB.text = comics.title;
    [cell.chapter4Image sd_setImageWithURL:[NSURL URLWithString:comics.cover_image_url]];
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"MM月dd日 HH:mm:ss"];
//    NSDate *date = [formatter dateFromString:comics.created_at];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:comics.created_at];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    cell.Time4LB.text =confromTimespStr;
    TopicController * topVC = [TopicController new];
    topVC.topID = self.datailID;

    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TopicController *topicVC = [self.storyboard instantiateViewControllerWithIdentifier:@"identer"];
//    UINavigationController *datailNC = [[UINavigationController alloc] initWithRootViewController:topicVC];
    
    Comics *comics = self.chapter.comicsArray[indexPath.row];
    
    topicVC.topID = comics.ID;
    [self.navigationController pushViewController:topicVC animated:YES];

}



-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        self.dataArray = [NSMutableArray array];
        
    }
    
    return _dataArray;
}

@end
