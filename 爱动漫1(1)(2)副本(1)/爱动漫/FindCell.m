//
//  FindCell.m
//  爱动漫
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "FindCell.h"
#import "UIImageView+WebCache.h"
#import "FindManager.h"

@interface FindCell()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UILabel *title4find;
@property (strong, nonatomic) IBOutlet UICollectionView *collection4find;


//用来保存数据
@property (nonatomic, strong) Group *currentGroup;


@end

@implementation FindCell


static NSString  *ident = @"cell";


- (void)setGroup:(Group *)group
{
    self.currentGroup = group;
    self.title4find.text = group.title;
    self.collection4find.dataSource = self;
    self.collection4find.delegate = self;
    
    [self.collection4find registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Item_Id"];
    
    
    [self.collection4find reloadData];
}


#pragma mark - CollectionView 代理
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if ([self.currentGroup.typeNum integerValue] == 0) {
        return self.currentGroup.topicsArray.count;
    }else if ([self.currentGroup.typeNum integerValue] == 1){
        return self.currentGroup.comicArray.count;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Item_Id" forIndexPath:indexPath];
    
    UIImageView *imgView = (UIImageView *)[cell viewWithTag:101];
    if (imgView == nil) {
        imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 85,150)];
        
        imgView.tag = 101;
        
        [cell addSubview:imgView];
    }
    
    if ([self.currentGroup.typeNum integerValue] == 0) {
        Topic *topic = [self.currentGroup.topicsArray objectAtIndex:indexPath.item];
        [imgView sd_setImageWithURL:[NSURL URLWithString:[topic vertical_image_url]]];
    }else if ([self.currentGroup.typeNum integerValue] == 1){
        Comic *comic = [self.currentGroup.comicArray objectAtIndex:indexPath.item];
        [imgView sd_setImageWithURL:[NSURL URLWithString:[comic cover_image_url]]];
    }
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100 , 150);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickImageViewOfCollectionView:index:)]) {
        [self.delegate clickImageViewOfCollectionView:self.collection4find index:indexPath];
    }
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
