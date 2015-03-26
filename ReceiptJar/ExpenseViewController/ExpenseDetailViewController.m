//
//  ExpenseDetailViewController.m
//  ReceiptJar
//
//  Created by Lei Zhao on 25/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import "ExpenseDetailViewController.h"
#import "Constants.h"
#import "CoreDataHelper.h"
#import "CameraViewController.h"
#import "SimpleExpenseCell.h"
#import "PhotoExpenseCell.h"

@interface ExpenseDetailViewController ()

@end

@implementation ExpenseDetailViewController{
    UITapGestureRecognizer* _tap;
    UITextField* _currentTextField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnScreen)];
    [self.tableView addGestureRecognizer:_tap];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SimpleExpenseCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SimpleExpenseCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PhotoExpenseCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([PhotoExpenseCell class])];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tapOnScreen{
    if (_currentTextField) {
        [_currentTextField resignFirstResponder];
        _currentTextField = nil;
    }
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 6) {
        return 224.0;
    }
    return UITableViewAutomaticDimension;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 7;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    switch (indexPath.row) {
        case 6:
            cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PhotoExpenseCell class]) forIndexPath:indexPath];
            break;
        default:
            cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SimpleExpenseCell class]) forIndexPath:indexPath];
            break;
    }
    
    // Configure the cell...
    if ([cell isKindOfClass:[SimpleExpenseCell class]]) {
        ((SimpleExpenseCell*)cell).textField.delegate = self;
    }
    
    switch (indexPath.row) {
        case 0:
            ((SimpleExpenseCell*)cell).titleLabel.text = @"Title";
            ((SimpleExpenseCell*)cell).textField.text = self.expense.title;
            break;
        case 1:
            ((SimpleExpenseCell*)cell).titleLabel.text = @"Date";
            ((SimpleExpenseCell*)cell).textField.text = [self.expense.date stringAsFormat:nil];
            break;
        case 2:
            ((SimpleExpenseCell*)cell).titleLabel.text = @"Amount";
            ((SimpleExpenseCell*)cell).textField.text = [NSString stringWithFormat:@"$ %.2f", self.expense.totalAmountValue];
            break;
        case 3:
            ((SimpleExpenseCell*)cell).titleLabel.text = @"Location";
            ((SimpleExpenseCell*)cell).textField.text = self.expense.location;
            break;
        case 4:
            ((SimpleExpenseCell*)cell).titleLabel.text = @"Category";
            ((SimpleExpenseCell*)cell).textField.text = self.expense.deductCategory.name;
            break;
        case 5:
            ((SimpleExpenseCell*)cell).titleLabel.text = @"Type";
            ((SimpleExpenseCell*)cell).textField.text = self.expense.type.name;
            break;
        case 6:
            ((PhotoExpenseCell*)cell).titleLabel.text = @"Receipts";
            ((PhotoExpenseCell*)cell).expense = self.expense;
        default:
            break;
    }
    
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

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    _currentTextField = textField;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return NO;
}

@end
