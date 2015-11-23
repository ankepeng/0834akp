//
//  FindManager.m
//  爱动漫
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "FindManager.h"
#import "Group.h"

@interface FindManager()
@property (nonatomic, strong) NSMutableArray *allData;


@end
@implementation FindManager

+ (instancetype)sharedFindManager
{
    static FindManager *dh = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dh = [[FindManager alloc] init];
    });
    return dh;
}

- (instancetype)init
{
    if (self = [super init]) {
        [self requestData];
    }
    return self;
}



- (NSMutableArray *)dataArray
{
    return [self.allData copy];
}


- (void)requestData
{
    NSString *urlStr = @"http://api.kuaikanmanhua.com/v1/topic_lists/mixed";
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:conf];
    
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        //解析数据
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *dic = [rootDic objectForKey:@"data"];
        NSArray *array = [dic objectForKey:@"topics"];
        for (NSDictionary *dic in array) {
            Group *group = [[Group alloc] init];
            [group setValuesForKeysWithDictionary:dic];
            [self.allData addObject:group];
        }
        
        NSLog(@"解析完成 %ld", [self.allData count]);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.callBack();
        });
        
    }];
    [dataTask resume];
}



- (NSMutableArray *)allData
{
    if (_allData == nil) {
        self.allData = [NSMutableArray array];
    }
    return _allData;
}


@end
