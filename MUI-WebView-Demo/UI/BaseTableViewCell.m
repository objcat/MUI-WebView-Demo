//
//  BaseTableViewCell.m
//  MUI-WebView-Demo
//
//  Created by 张祎 on 2018/10/26.
//  Copyright © 2018年 objcat. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface BaseTableViewCell ()
@property (strong, nonatomic) CALayer *lineLayer;
@end

@implementation BaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self addLineLayer];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)addLineLayer {
    if (!self.lineLayer) {
        self.lineLayer = [[CALayer alloc] init];
        self.lineLayer.backgroundColor = [UIColor colorWithRed:200 / 255.0 green:199 / 255.0 blue:204 / 255.0 alpha:1].CGColor;
        [self.contentView.layer addSublayer:self.lineLayer];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.lineLayer.frame = CGRectMake(0, self.contentView.frame.size.height - 0.5, self.contentView.frame.size.width - 0, 0.5);
}

@end
