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
@property (strong, nonatomic) IBOutlet UIView *tableViewBackgroundView;
@property (strong, nonatomic) IBOutlet UIView *tableHeaderView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableHeaderViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableHeaderViewTop;

@end
