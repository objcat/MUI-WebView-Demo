//
//  RowModel.h
//  MUI-WebView-Demo
//
//  Created by 张祎 on 2018/10/26.
//  Copyright © 2018年 objcat. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RowModel : NSObject
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) NSArray *staticLib;
@property (strong, nonatomic) NSArray *systemLib;
@property (assign, nonatomic) BOOL open;
@end

NS_ASSUME_NONNULL_END
