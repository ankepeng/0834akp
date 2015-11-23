//
//  Group.h
//  Cell-CollectionTest
//
//  Created by 马德茂 on 15/10/29.
//  Copyright © 2015年 MaDemao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Topic.h"
#import "Comic.h"
@interface Group : NSObject

@property (nonatomic, copy) NSString *action;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSMutableArray *topicsArray;
@property (nonatomic, strong) NSMutableArray *comicArray;
@property (nonatomic, strong) NSNumber *typeNum;

@end
