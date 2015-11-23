//
//  Group.m
//  Cell-CollectionTest
//
//  Created by 马德茂 on 15/10/29.
//  Copyright © 2015年 MaDemao. All rights reserved.
//

#import "Group.h"

@implementation Group

- (instancetype)init
{
    if (self = [super init]) {
        self.typeNum = @0;
    }
    return self;
}



- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"type"]) {
        self.typeNum = (NSNumber *)value;
    }
    if ([key isEqualToString:@"topics"]) {
        for (NSDictionary *dic in (NSArray *)value) {
            Topic *topic = [[Topic alloc] init];
            [topic setValuesForKeysWithDictionary:dic];
            [self.topicsArray addObject:topic];
        }
    }
    if ([key isEqualToString:@"comics"]) {
        for (NSDictionary *dic in (NSArray *)value) {
            Comic *comic = [[Comic alloc] init];
            [comic setValuesForKeysWithDictionary:dic];
            [self.comicArray addObject:comic];
        }
    }
}

- (NSMutableArray *)topicsArray
{
    if (_topicsArray == nil) {
        self.topicsArray = [NSMutableArray array];
    }
    return _topicsArray;
}

- (NSMutableArray *)comicArray
{
    if (_comicArray == nil) {
        self.comicArray = [NSMutableArray array];
    }
    return _comicArray;
}

@end
