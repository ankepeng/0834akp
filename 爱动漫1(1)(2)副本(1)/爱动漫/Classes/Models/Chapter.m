//
//  Chapter.m
//  爱动漫
//
//  Created by lanou3g on 15/11/22.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "Chapter.h"
#import "Comics.h"

@implementation Chapter

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
   
    
    if ([key isEqualToString:@"comics"]) {
        for (NSDictionary *dic in (NSArray *)value) {
            Comics *comics = [[Comics alloc] init];
            [comics setValuesForKeysWithDictionary:dic];
            [self.comicsArray addObject:comics];
        }
    }
    if ([key isEqualToString:@"comics_count"]) {
        self.comics_count = [(NSNumber *)value stringValue];
    }
    if ([key isEqualToString:@"description"]) {
        _descriptionStr = value;
    }
    if ([key isEqualToString:@"id"]) {
        self.ID = [(NSNumber *)value stringValue];
    }
    if ([key isEqualToString:@"comments_count"]) {
        self.comments_count = [(NSNumber *)value stringValue];
    }
    if ([key isEqualToString:@"created_at"]) {
        self.created_at = [(NSNumber *)value stringValue];
    }
    if ([key isEqualToString:@"likes_count"]) {
        self.likes_count = [(NSNumber *)value stringValue];
    }
    if ([key isEqualToString:@"updated_at"]) {
        self.updated_at = [(NSNumber *)value stringValue];
    }
    if ([key isEqualToString:@"user"]) {
        self.nickname = [(NSDictionary *)value objectForKey:@"nickname"];
    }
    if ([key isEqualToString:@"user"]) {
        self.avatar_url = [(NSDictionary *)value objectForKey:@"avatar_url"];
    }

}


- (NSMutableArray *)comicsArray
{
    if (_comicsArray == nil) {
        self.comicsArray = [NSMutableArray array];
    }
    return _comicsArray;
}

@end
