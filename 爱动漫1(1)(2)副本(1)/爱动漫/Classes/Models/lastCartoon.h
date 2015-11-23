//
//  lastCartoon.h
//  爱动漫
//
//  Created by lanou3g on 15/11/22.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lastCartoon : NSObject

@property(nonatomic,strong )NSString *banner_info;
@property(nonatomic,strong )NSString *comments_count;
@property(nonatomic,strong )NSString *cover_image_url;
@property(nonatomic,strong )NSString *created_at;
@property(nonatomic,strong )NSString *ID;
@property(nonatomic,copy )NSMutableArray *images;
@property(nonatomic,strong )NSString *likes_count;
@property(nonatomic,strong )NSString *previous_comic_id;
@property(nonatomic,strong )NSString *title;



@end
