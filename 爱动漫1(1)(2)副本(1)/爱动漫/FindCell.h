//
//  FindCell.h
//  爱动漫
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Group.h"


@protocol ClickImageViewDelegate <NSObject>

- (void)clickImageViewOfCollectionView:(UICollectionView *)collectionView index:(NSIndexPath *)index;

@end

@interface FindCell : UITableViewCell
@property (nonatomic, assign) id<ClickImageViewDelegate> delegate;
//用来布局，在延展中另定义一个Group用来保存数据
@property (nonatomic, strong) Group *group;

@end
