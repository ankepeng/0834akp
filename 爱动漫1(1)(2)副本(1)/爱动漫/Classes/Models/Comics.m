//
//  Comics.m
//  爱动漫
//
//  Created by lanou3g on 15/11/22.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "Comics.h"

@implementation Comics
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
    if ([key isEqualToString:@"id"]) {
        self.ID = [(NSNumber *)value stringValue];
    }
//    if ([key isEqualToString:@"created_at"]) {
//        self.created_at = [(NSNumber *)value stringValue];
//    }
    if ([key isEqualToString:@"likes_count"]) {
        self.likes_count = [(NSNumber *)value stringValue];
    }
    if ([key isEqualToString:@"updated_at"]) {
        self.updated_at = [(NSNumber *)value stringValue];
    }
    if ([key isEqualToString:@"topic_id"]) {
        self.topic_id = [(NSNumber *)value stringValue];
    }

    
}


@end
