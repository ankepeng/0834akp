//
//  Comic.m
//  Cell-CollectionTest
//
//  Created by 马德茂 on 15/10/29.
//  Copyright © 2015年 MaDemao. All rights reserved.
//

#import "Comic.h"

@implementation Comic
/*
 "cover_image_url": "http://i.kuaikanmanhua.com/image/151016/ezwbquflx.jpg-w640",
 "created_at": 1444990104,
 "id": 6275,
 "title": "9\u6708\u4f5c\u54c1\u6392\u884c\u699c",
 "topic": {
 "comics_count": 2,
 "cover_image_url": "http://i.kuaikanmanhua.com/image/151016/ks7ljbji6.jpg-w640",
 "created_at": 1444988920,
 "description": "\u6bcf\u6708\u4e2d\u65ec\u90fd\u4f1a\u5728\u8fd9\u91cc\u66f4\u65b0\u7684\u4f5c\u54c1\u6392\u884c\u699c",
 "id": 570,
 "order": 0,
 "title": "\u5168\u6c11\u6253\u699c",
 "updated_at": 1444988920,
 "user": {
 "avatar_url": "http://i.kuaikanmanhua.com/image/150707/m2stwc3hz.jpg-w180",
 "id": 1063214,
 "nickname": "",
 "reg_type": "author"
 },
 "vertical_image_url": "http://i.kuaikanmanhua.com/<FileStorage: u'\\u5168\\u6c11\\u6253\\u699c1.jpg' ('i-w320"
 },
 "updated_at": 1444990034,
 "url": "http://www.kuaikanmanhua.com/comics/6275"
 */

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"created_at"]) {
        self.created_atStr = [(NSNumber *)value stringValue];
    }
    if ([key isEqualToString:@"id"]) {
        self.theID = [(NSNumber *)value stringValue];
    }
    if ([key isEqualToString:@"topic"]) {
        self.theTopic = [[Topic alloc] init];
        [self.theTopic setValuesForKeysWithDictionary:(NSDictionary *)value];
    }
    if ([key isEqualToString:@"updated_at"]) {
        self.updated_atStr = [(NSNumber *)value stringValue];
    }
}
@end
