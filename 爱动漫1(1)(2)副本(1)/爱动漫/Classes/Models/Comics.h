//
//  Comics.h
//  爱动漫
//
//  Created by lanou3g on 15/11/22.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comics : NSObject
@property(nonatomic,strong )NSString *cover_image_url;
@property(nonatomic,assign )NSInteger created_at;
@property(nonatomic,strong )NSString *ID;
@property(nonatomic,strong )NSString *likes_count;
@property(nonatomic,strong )NSString *title;
@property(nonatomic,strong )NSString *topic_id;
@property(nonatomic,strong )NSString *updated_at;
@property(nonatomic,strong )NSString *url;


@end
