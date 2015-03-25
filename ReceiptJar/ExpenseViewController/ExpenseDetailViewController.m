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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SimpleExpenseCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SimpleExpenseCell class]) forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textField.delegate = self;
    
    switch (indexPath.row) {
        case 0:
            cell.titleLabel.text = @"Title";
            cell.textField.text = self.expense.title;
            break;
        case 1:
            cell.titleLabel.text = @"Date";
            cell.textField.text = [self.expense.date stringAsFormat:nil];
            break;
        case 2:
            cell.titleLabel.text = @"Amount";
            cell.textField.text = [NSString stringWithFormat:@"$ %.2f", self.expense.totalAmountValue];
            break;
        case 3:
            cell.titleLabel.text = @"Location";
            cell.textField.text = self.expense.location;
            break;
        case 4:
            cell.titleLabel.text = @"Category";
            cell.textField.text = self.expense.deductCategory.name;
            break;
        case 5:
            cell.titleLabel.text = @"Type";
            cell.textField.text = self.expense.type.name;
            break;
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
