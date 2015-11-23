//
//  DatailHelp.h
//  爱动漫
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "datail.h"
@class DatailHelp;
@protocol  DatailHelpDelegate <NSObject>

- (void)sendImages:(datail*)datail;
@end

typedef void (^Callback)();

//typedef void(^DatailBlock)(datail *datail);

@interface DatailHelp : NSObject
+(instancetype)sharedManager;


@property(nonatomic,assign )id <DatailHelpDelegate>delegated;
//@property(nonatomic,copy )DatailBlock datailBlock;


- (void)loadSearchResultWithID:(NSString *)ID completion:(Callback)completion;


- (NSArray *)datailArray;

@property (nonatomic, strong) datail *datail;


@end
