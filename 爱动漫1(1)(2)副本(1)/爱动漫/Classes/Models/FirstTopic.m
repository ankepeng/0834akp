//
//  FirstTopic.m
//  爱动漫
//
//  Created by lanou3g on 15/11/23.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "FirstTopic.h"

@implementation FirstTopic
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        _subject_id = value;
    }
    if ([key isEqualToString:@"description"]) {
        _subject_description = value;
    }
    
}

@end
