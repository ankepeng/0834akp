//
//  Comic.h
//  Cell-CollectionTest
//
//  Created by 马德茂 on 15/10/29.
//  Copyright © 2015年 MaDemao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Topic.h"
@interface Comic : NSObject

@property (nonatomic, copy) NSString *cover_image_url;
@property (nonatomic, copy) NSString *created_atStr;
@property (nonatomic, copy) NSString *theID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) Topic *theTopic;
@property (nonatomic, copy) NSString *vertical_image_url;
@property (nonatomic, copy) NSString *updated_atStr;
@property (nonatomic, copy) NSString *url;
@end
