//
//  SimpleExpenseCell.h
//  ReceiptJar
//
//  Created by Lei Zhao on 25/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleExpenseCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end
