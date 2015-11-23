//
//  datailCell.m
//  爱动漫
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "datailCell.h"
#import "datail.h"
#import "UIImageView+WebCache.h"

@interface datailCell ()
@property (strong, nonatomic) IBOutlet UIImageView *datailImage;

@end

@implementation datailCell

- (void)setUrl:(NSString *)url{
    [_datailImage sd_setImageWithURL:[NSURL URLWithString:url]];
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
