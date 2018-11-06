//
//  RowOpenTableViewCell.m
//  MUI-WebView-Demo
//
//  Created by 张祎 on 2018/10/26.
//  Copyright © 2018年 objcat. All rights reserved.
//

#import "RowOpenTableViewCell.h"

@interface RowOpenTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *staticLibLabel;
@property (weak, nonatomic) IBOutlet UILabel *systemLibLabel;
@property (weak, nonatomic) IBOutlet UILabel *privacyLabel;
@end

@implementation RowOpenTableViewCell

- (void)setModel:(RowModel *)model {
    [super setModel:model];
    self.titleLabel.text = model.title;
    self.staticLibLabel.text = [self libFromArray:model.staticLib];
    self.systemLibLabel.text = [self libFromArray:model.systemLib];
    self.privacyLabel.text = [self libFromArray:model.privacys];
}

- (NSString *)libFromArray:(NSArray *)array {
    NSString *result = @"";
    for (NSString *lib in array) {
        if (lib == [array lastObject]) {
            result = [NSString stringWithFormat:@"%@%@", result, lib];
            break;
        }
        result = [NSString stringWithFormat:@"%@%@\n", result, lib];
    }
    
    if ([result isEqualToString:@""]) {
        return @"无";
    }
    
    return result;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)close:(id)sender {
    self.model.open = NO;
    if (self.openBlock) {
        self.openBlock();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
