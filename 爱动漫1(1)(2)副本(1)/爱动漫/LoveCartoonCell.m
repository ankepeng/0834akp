//
//  LoveCartoonCell.m
//  爱动漫
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "LoveCartoonCell.h"
#import "LoveCartoon.h"
#import "UIImageView+WebCache.h"
#import "FirstTopic.h"
@interface  LoveCartoonCell()
@property (strong, nonatomic) IBOutlet UIImageView *imagone;
@property (strong, nonatomic) IBOutlet UILabel *Cartoon;
@property (strong, nonatomic) IBOutlet UILabel *comment4LB;
@property (strong, nonatomic) IBOutlet UILabel *share4LB;
@property (strong, nonatomic) IBOutlet UILabel *attention4LB;
@property (strong, nonatomic) IBOutlet UILabel *topic4LB;
@property (strong, nonatomic) IBOutlet UILabel *ID4LB;

@end

@implementation LoveCartoonCell

@dynamic loveCartoon;

- (void)setLoveCartoon:(LoveCartoon *)loveCartoon{
    self.Cartoon.text = loveCartoon.title;
    [_imagone sd_setImageWithURL:[NSURL URLWithString:loveCartoon.cover_image_url]];
    
    self.comment4LB.text = [NSString stringWithFormat:@"评论:%@",loveCartoon.comments_count];
    self.share4LB.text = [NSString stringWithFormat:@"分享:%@",loveCartoon.shared_count];
    self.attention4LB.text = [NSString stringWithFormat:@"关注:%@",loveCartoon.likes_count];
    
//    self.topic4LB.text =loveCartoon.title;
//    self.ID4LB.text = loveCartoon.ID;
    
}
-(void)setFirstTopic:(FirstTopic *)firstTopic{
    self.topic4LB.text = firstTopic.title;

    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[firstTopic.updated_at integerValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    self.ID4LB.text =[NSString stringWithFormat:@"更新时间：%@",confromTimespStr];
   
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
