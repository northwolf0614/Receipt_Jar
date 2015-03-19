//
//  ExpenseTableViewController.h
//  ReceiptJar
//
//  Created by Lei Zhao on 19/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpenseTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, weak)IBOutlet UITableView* tableView;

@end
