//
//  ExpenseDetailViewController.h
//  ReceiptJar
//
//  Created by Lei Zhao on 25/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataEntityHeaders.h"

@interface ExpenseDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) CDExpense* expense;
@end
