//
//  RowTableViewCell.m
//  MUI-WebView-Demo
//
//  Created by 张祎 on 2018/10/26.
//  Copyright © 2018年 objcat. All rights reserved.
//

#import "RowTableViewCell.h"

@interface RowTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation RowTableViewCell

- (void)setModel:(RowModel *)model {
    [super setModel:model];
    self.titleLabel.text = model.title;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)open:(id)sender {
    self.model.open = YES;
    if (self.openBlock) {
        self.openBlock();
    }
}

@end
