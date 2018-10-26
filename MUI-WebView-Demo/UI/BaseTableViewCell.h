//
//  BaseTableViewCell.h
//  MUI-WebView-Demo
//
//  Created by 张祎 on 2018/10/26.
//  Copyright © 2018年 objcat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RowModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewCell : UITableViewCell
@property (strong, nonatomic) RowModel *model;
@property (copy, nonatomic) void (^openBlock) (void);
@end

NS_ASSUME_NONNULL_END
