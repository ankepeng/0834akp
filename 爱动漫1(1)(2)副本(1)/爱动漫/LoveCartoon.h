//
//  LoveCartoon.h
//  爱动漫
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoveCartoon : NSObject
@property(nonatomic,strong )NSString *comments_count;//评论数
@property(nonatomic,strong )NSString *cover_image_url;//列表封面图片
@property(nonatomic,strong )NSNumber *created_at;//最新作品发表时间
@property(nonatomic,strong )NSString *ID;//作品列表id(需要处理)
@property(nonatomic,assign )BOOL is_liked;//取消关注
@property(nonatomic,strong )NSString *likes_count;//关注数
@property(nonatomic,strong )NSString *shared_count;//分享数
@property(nonatomic,strong )NSString *title;//小标题名
@property(nonatomic, strong) NSDictionary *topic;//主题
@property(nonatomic,strong )NSString *updated_at;//刷新时间
@property(nonatomic,strong )NSString *url;//漫画网址


@end
