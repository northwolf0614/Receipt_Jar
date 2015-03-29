//
//  SegmentedExpenseCell.h
//  ReceiptJar
//
//  Created by Lei Zhao on 30/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SegmentedExpenseCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end
