//
//  FindManager.h
//  爱动漫
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^myBlock)(void);


typedef void (^FindBlock)();

@interface FindManager : NSObject

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, copy) myBlock callBack;


+ (instancetype)sharedFindManager;
@end
