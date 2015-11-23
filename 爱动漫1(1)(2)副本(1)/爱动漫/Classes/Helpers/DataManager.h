//
//  DataManager.h
//  爱动漫
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoveCartoon.h"
#import "FirstTopic.h"


typedef void(^ReloadBlock)();

@interface DataManager : NSObject

+(instancetype)sharedManager;
//- (void)requestData:(NSString *)urlStr;
//提供一个外界可以调用数据的数组
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *topicArray;
@property (nonatomic, strong) NSArray *authorArray;
@property(nonatomic,copy )ReloadBlock reloadBlock;

-(LoveCartoon *)loveCartoonWithIndex:(NSInteger)index;
-(FirstTopic *)firstTopicWithIndex:(NSInteger)index;
@end
