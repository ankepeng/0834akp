//
//  DatailController.h
//  爱动漫
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "datail.h"

@interface DatailController : UITableViewController

@property (nonatomic, strong) NSString *datailID;
@property(nonatomic,retain )datail *datail;

@end
