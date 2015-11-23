//
//  DataManager.m
//  爱动漫
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "DataManager.h"
#import "LoveCartoonController.h"
#import "AFNetworking.h"
#import "Urls.h"
#import "LoveCartoon.h"
@interface DataManager();
@property (nonatomic,strong)NSMutableArray *LoveArray;
@property (nonatomic,strong)NSMutableArray *topic1Array;
@property (nonatomic,strong)NSMutableArray *author1Array;
@end
@implementation DataManager

+(instancetype)sharedManager{
    static DataManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [DataManager new];
        [manager request];
    });
    return manager;
}

-(void)request{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
  /*
        // 1、创建AFHTTPRequestOperationManager ---HTTP请求操作管理类的对象
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        // 2、发送GET请求
        // 如果返回的数据格式是xml则需要添加：设置响应格式为XML格式：
        // manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
        // 如果JSON和XML格式都解析不出来，就按DATA格式解析：
        // manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [manager GET:@"http://www.acfun.tv/bangumi/bangumi/page?pageSize=42&isWeb=1&pageNo=1&sort=1" parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
            // responseObject就是服务器响应的对象。
            NSLog(@"%@", responseObject);
        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
            // 这里是错误处理
            NSLog(@"error:%@",error);
        }];
 */
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
 
        [manager GET:kMainUrl parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {         
            NSDictionary *dic = [NSDictionary dictionaryWithDictionary:responseObject];
            NSDictionary *dic2 = dic[@"data"];
            NSArray *array = dic2[@"comics"];
            for (NSDictionary *obj in array) {
                
                LoveCartoon *loveCN = [LoveCartoon new];
                [loveCN setValuesForKeysWithDictionary:obj];
                [self.LoveArray addObject:loveCN];

                
                NSDictionary *dic3 = loveCN.topic;
                FirstTopic *first = [FirstTopic new];
                [first setValuesForKeysWithDictionary:dic3];

                [self.topic1Array addObject:first];
                
     
                
            }
            
            
    
            
            
            
//            返回主线程
            dispatch_async(dispatch_get_main_queue(), ^{
                if (!self.reloadBlock) {
                    NSLog(@"block没有值");
                }else{
                    self.reloadBlock();
                }
            });
  
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            NSLog(@"error :%@",error);
        }];
    });
}

-(LoveCartoon *)loveCartoonWithIndex:(NSInteger)index{
    return  self.dataArray[index];
}

-(FirstTopic *)firstTopicWithIndex:(NSInteger)index{
    return  self.topicArray[index];
    
}
#pragma mark-----懒加载
-(NSMutableArray *)LoveArray{
    if (!_LoveArray) {
        _LoveArray = [NSMutableArray array];
    }
    return _LoveArray;
}
-(NSMutableArray *)topic1Array{
    if (!_topic1Array) {
        _topic1Array = [NSMutableArray new];
    }
    return _topic1Array;
}
//-(NSMutableArray *)author1Array{
//    if (!_authorArray) {
//        _authorArray =  [NSMutableArray new];
//    }
//    return _author1Array;
//    
//}
-(NSArray *)dataArray{
    
    return self.LoveArray;
    
}

- (NSArray *)topicArray{
    
    
    return self.topic1Array;
}


@end
