//
//  datail.h
//  爱动漫
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface datail : NSObject

@property(nonatomic,strong )NSString *pic;
@property(nonatomic,strong )NSString *target_app_url;
@property(nonatomic,strong )NSString *target_package_name;
@property(nonatomic,strong )NSString *target_title;
@property(nonatomic,strong )NSString *target_web_url;
@property(nonatomic,strong )NSString *type;
@property(nonatomic,strong )NSString *comments_count;
@property(nonatomic,strong )NSString *cover_image_url;
@property(nonatomic,strong )NSString *created_at;
@property(nonatomic,strong )NSString *ID;
@property(nonatomic,strong )NSMutableArray *images;
@property(nonatomic,strong )NSString *is_favourite;
@property(nonatomic,strong )NSString *is_liked;
@property(nonatomic,strong )NSString *likes_count;
@property(nonatomic,strong )NSString *next_comic_id;
@property(nonatomic,strong )NSString *previous_id;
@property(nonatomic,strong )NSString *recommend_count;
@property(nonatomic,strong )NSString *title;
@property(nonatomic,strong )NSString *updated_at;
@property(nonatomic,strong )NSString *url;
@end
