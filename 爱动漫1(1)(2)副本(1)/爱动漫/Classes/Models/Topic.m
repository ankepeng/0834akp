//
//  Topic.m
//  Cell-CollectionTest
//
//  Created by 马德茂 on 15/10/29.
//  Copyright © 2015年 MaDemao. All rights reserved.
//

#import "Topic.h"

/*
 "comics_count": 16,
 "cover_image_url": "http://i.kuaikanmanhua.com/image/150912/g18bf2bl4.jpg-w640",
 "created_at": 1437645683,
 "description": "5\u4e2a\u5c11\u7537\u5c11\u5973\uff0c\u5728\u604b\u7231\u7684\u9053\u8def\u4e0a\u4f1a\u6536\u83b7\u591a\u5c11\u751c\u871c\uff0c\u53c8\u9047\u5230\u591a\u5c11\u5d0e\u5c96\u5462\uff1f\u4e00\u6bb5\u5c5e\u4e8e\u4ed6\u4eec\u7231\u60c5\u7684\u9752\u6625\u4e4b\u65c5\uff0c\u5c55\u5f00\u4e86\u2026\u2026\u3010\u72ec\u5bb6/\u6bcf\u5468\u4e8c\u4e94\u66f4\u65b0\uff0c\u8d23\u7f16\uff1a\u54d1\u94c3lynn\u3011",
 "id": 420,
 "is_favourite": false,
 "order": 200,
 "title": "\u76f4\u5230\u6700\u540e\u4e00\u9897\u661f\u8fb0",
 "updated_at": 1437645683,
 "user": {
 "avatar_url": "http://i.kuaikanmanhua.com/image/150421/uelm8ugiz.jpg-w180",
 "id": 47124,
 "nickname": "\u203bkid\u5c81",
 "reg_type": "weibo"
 },
 "vertical_image_url": "http://i.kuaikanmanhua.com/image/150801/jk3u0zijd.jpg-w320"
 */

@implementation Topic

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"comics_count"]) {
        self.comics_countStr = [(NSNumber *)value stringValue];
    }
    if ([key isEqualToString:@"created_at"]) {
        self.created_atStr = [(NSNumber *)value stringValue];
    }
    if ([key isEqualToString:@"description"]) {
        self.descriptionStr = value;
    }
    if ([key isEqualToString:@"id"]) {
        self.theID = [(NSNumber *)value stringValue];
    }
    if ([key isEqualToString:@"order"]) {
        self.orderStr = [(NSNumber *)value stringValue];
    }
    if ([key isEqualToString:@"updated_at"]) {
        self.updated_atStr = [(NSNumber *)value stringValue];
    }
    if ([key isEqualToString:@"user"]) {
        self.nickname = [(NSDictionary *)value objectForKey:@"nickname"];
    }
}

@end
