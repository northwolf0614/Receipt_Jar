//
//  SegmentedExpenseCell.m
//  ReceiptJar
//
//  Created by Lei Zhao on 30/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import "SegmentedExpenseCell.h"
#import "Constants.h"

@implementation SegmentedExpenseCell

- (void)awakeFromNib {
    self.segmentedControl.tintColor = DEFAULT_GREY;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
