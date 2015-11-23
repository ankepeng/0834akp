//
//  Chapter.h
//  爱动漫
//
//  Created by lanou3g on 15/11/22.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Chapter : NSObject
@property(nonatomic,strong )NSMutableArray *comicsArray;
@property(nonatomic,strong )NSString *comics_count;
@property(nonatomic,strong )NSString *comments_count;
@property(nonatomic,strong )NSString *cover_image_url;
@property(nonatomic,strong )NSString *created_at;
@property(nonatomic,strong )NSString *descriptionStr;
@property(nonatomic,strong )NSString *ID;
@property(nonatomic,assign )BOOL *is_favourite;
@property(nonatomic,strong )NSString *likes_count;
@property(nonatomic,strong )NSString *title;
@property(nonatomic,strong )NSString *updated_at;
@property(nonatomic,copy) NSString *nickname;
@property(nonatomic,strong) NSString *avatar_url;
@property(nonatomic,strong )NSString *vertical_image_url;
@end
