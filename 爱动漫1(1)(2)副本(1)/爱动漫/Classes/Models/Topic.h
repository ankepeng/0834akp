//
//  Topic.h
//  Cell-CollectionTest
//
//  Created by 马德茂 on 15/10/29.
//  Copyright © 2015年 MaDemao. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface Topic : NSObject

@property (nonatomic, copy) NSString *comics_countStr;
@property (nonatomic, copy) NSString *cover_image_url;
@property (nonatomic, copy) NSString *created_atStr;
@property (nonatomic, copy) NSString *descriptionStr;
@property (nonatomic, copy) NSString *theID;
@property (nonatomic, assign) BOOL is_favourite;
@property (nonatomic, copy) NSString *orderStr;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *updated_atStr;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *vertical_image_url;

@end
