//
//  DatailHelp.m
//  爱动漫
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "DatailHelp.h"
#import "DatailController.h"
#import "datail.h"
#import "Urls.h"
#import "AFNetworking.h"


@interface  DatailHelp()
@property(nonatomic,strong)NSMutableArray * datailarray2;

@end
@implementation DatailHelp

-(NSMutableArray *)datailarray2
{
    if (!_datailarray2) {
        _datailarray2 = [NSMutableArray arrayWithCapacity:10];
    }
    return _datailarray2;
}

+(instancetype)sharedManager{
    static DatailHelp *datailhelp = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      
        datailhelp = [DatailHelp new];
        
//        [datailhelp request];
        
    });
    
    return datailhelp;
}

// 根据ID解析数据
- (void)loadSearchResultWithID:(NSString *)ID completion:(Callback)completion
{
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        NSString * ste = [NSString stringWithFormat:@"http://api.kuaikanmanhua.com/v1/comics/%@", ID];
        
        [manager GET:ste parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            NSLog(@"%@",responseObject);
            NSDictionary *dic = [NSDictionary dictionaryWithDictionary:responseObject];
            NSDictionary *dic1 = dic[@"data"];
            NSArray *array = dic1[@"images"];
            datail *data = [[datail alloc]init];
            data.images = [NSMutableArray arrayWithArray:array];
            
            
            if ([_delegated respondsToSelector:@selector(sendImages:)] && _delegated) {
                [_delegated sendImages:data];
            }
            
//            dispatch_async(dispatch_get_main_queue(), ^{
//               
//            });
//            
//            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            NSLog(@"error :%@",error);
        }];
//    });
}

/*
-(void)request{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        [manager GET:kDatailUrl parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            NSLog(@"%@",responseObject);
            NSDictionary *dic = [NSDictionary dictionaryWithDictionary:responseObject];
            NSDictionary *dic1 = dic[@"data"];
            NSDictionary *dic2 = dic1[@"banner_info"];
            for (NSDictionary *dic3 in dic2) {
                datail *data = [datail new];
                [data setValuesForKeysWithDictionary:dic3];
                [self.datailarray addObject:data];
            }
            
         //            返回主线程
         dispatch_async(dispatch_get_main_queue(), ^{
            if (!self.datailBlock) {
                NSLog(@"block没有值");
            }else{
                self.datailBlock();
            }
        });
         
         } failure:^(NSURLSessionDataTask *task, NSError *error) {
             
             NSLog(@"error :%@",error);
         }];
    });
}
*/

- (NSArray *)datailArray
{
    return [self.datailArray copy];
}





@end
