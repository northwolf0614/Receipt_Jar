//
//  ExpenseSummaryCell.h
//  ReceiptJar
//
//  Created by Lei Zhao on 20/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SymbolView.h"

@interface ExpenseSummaryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *indicator;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalAmountLabel;
@property (weak, nonatomic) IBOutlet SymbolView *symboView;

@end
