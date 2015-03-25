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
#import "CameraViewController.h"
#import "DragDownAnimator.h"
#import "ExpenseDetailViewController.h"

@interface ExpenseTableViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headerMaskTop;


@end

const CGFloat DRAG_THRESHOLD = 200;
@implementation ExpenseTableViewController{
    NSDictionary* _expenses;
    NSArray* _sectionKeys;
    
    DragDownAnimator* _dragDownAnimator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //NavigationBar
    CGRect frame = self.navigationController.navigationBar.frame;
    self.tableView.contentInset = UIEdgeInsetsMake(frame.origin.y + frame.size.height, 0, 0, 0);
    self.tableHeaderViewTop.constant = frame.origin.y + frame.size.height;
    self.headerMaskTop.constant = frame.origin.y + frame.size.height;
    
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
    
    _dragDownAnimator = [[DragDownAnimator alloc] init];
    self.navigationController.delegate = self;
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


#pragma mark - Table view delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.headerMaskTop.constant = fabsf(self.tableView.contentOffset.y);
//    CGFloat height = fabsf(self.tableView.contentOffset.y) - self.tableHeaderViewTop.constant;
//    self.tableHeaderViewHeight.constant = height;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (fabsf(self.tableView.contentOffset.y) > DRAG_THRESHOLD) {
        CameraViewController* cameraViewController = [[CameraViewController alloc] init];
        cameraViewController.modalPresentationStyle = UIModalPresentationCustom;

        [self.navigationController pushViewController:cameraViewController animated:YES];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CDExpense* exp = _expenses[_sectionKeys[indexPath.section]][indexPath.row];
    ExpenseDetailViewController* detailVC = [[ExpenseDetailViewController alloc] init];
    detailVC.expense = exp;
    
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC{
    if ([toVC isKindOfClass:[CameraViewController class]]) {
        return _dragDownAnimator;
    }
    if ([fromVC isKindOfClass:[CameraViewController class]]) {
        return _dragDownAnimator;
    }
    
    return nil;
}
@end
