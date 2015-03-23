//
//  ExpenseTableViewController.m
//  ReceiptJar
//
//  Created by Lei Zhao on 19/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import "ExpenseTableViewController.h"
#import "Constants.h"
#import "ExpenseSummaryCell.h"
#import "CoreDataEntityHeaders.h"
#import "CoreDataHelper.h"

@interface ExpenseTableViewController ()
@property (strong, nonatomic) IBOutlet UIView *tableViewBackgroundView;
@property (strong, nonatomic) IBOutlet UIView *tableHeaderView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableHeaderViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableHeaderViewTop;

@end

@implementation ExpenseTableViewController{
    NSDictionary* _expenses;
    NSArray* _sectionKeys;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    CGRect frame = self.navigationController.navigationBar.frame;
    self.tableView.contentInset = UIEdgeInsetsMake(frame.origin.y + frame.size.height, 0, 0, 0);
    self.tableHeaderViewTop.constant = frame.origin.y + frame.size.height;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ExpenseSummaryCell class]) bundle:nil] forCellReuseIdentifier:@"cell"];
    
    [self groupExpenseByMonth];    
    if (_sectionKeys.count > 0) {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.tableView.backgroundView = nil;
    }
    else{
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.backgroundView = self.tableViewBackgroundView;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

    });
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setupTableHeaderView];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (void)setupTableHeaderView{

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)groupExpenseByMonth{
    NSArray* exps = [CDExpense sortedExpenseByAttribute:CDExpenseAttributes.date ascending:YES inManagedObjectContext:[[CoreDataHelper sharedInstance] moc]];
    _expenses = [exps groupByFilter:^(CDExpense* exp, NSUInteger idx, BOOL* stop){
        return [exp.date stringAsFormat:@"MMM yyyy"];
    }];
    
    _sectionKeys = [[_expenses allKeys] sortedArrayUsingComparator:^(NSString* key1, NSString* key2){
        NSDate* date1 = [key1 dateValueAsFormat:@"MMM yyyy"];
        NSDate* date2 = [key2 dateValueAsFormat:@"MMM yyyy"];
        return [date1 compare:date2];
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _sectionKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_expenses[_sectionKeys[section]] count];
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return _sectionKeys[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ExpenseSummaryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    CDExpense* exp = _expenses[_sectionKeys[indexPath.section]][indexPath.row];
    
    cell.indicator.backgroundColor = exp.deductCategory.color;
    
    cell.titleLabel.text = exp.title;
    cell.titleLabel.textColor = exp.deductCategory.color;
    
    cell.dateLabel.text = [exp.date stringAsFormat:@"dff eee"];
    cell.dateLabel.textColor = DEFAULT_GREY;
    
    cell.totalAmountLabel.text = [NSString stringWithFormat:@"$%.2f", exp.totalAmountValue];
    cell.totalAmountLabel.textColor = exp.deductCategory.color;
    
    cell.symboView.symbolColor = exp.type.color;
    cell.symboView.text = exp.type.symbolLetter;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
