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
#import "CoreDataEntityHeaders.h"
#import "MYManagedObject.h"
#import "CameraViewController.h"
#import "SimpleExpenseCell.h"
#import "PhotoExpenseCell.h"
#import "SegmentedExpenseCell.h"
#import "PopoverSelectionViewController.h"

@interface ExpenseDetailViewController () <UIPopoverPresentationControllerDelegate>

@end

@implementation ExpenseDetailViewController{
    UITextField* _currentTextField;
    NSArray* _allTypes;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _allTypes = [CDType fetchAllWithSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:CDTypeAttributes.sortIndex ascending:YES]] inManagedObjectContext:[[CoreDataHelper sharedInstance] moc]];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SimpleExpenseCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SimpleExpenseCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PhotoExpenseCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([PhotoExpenseCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SegmentedExpenseCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SegmentedExpenseCell class])];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        case 5:
            cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SegmentedExpenseCell class]) forIndexPath:indexPath];
            break;
        case 6:
            cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PhotoExpenseCell class]) forIndexPath:indexPath];
            break;
        default:
            cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SimpleExpenseCell class]) forIndexPath:indexPath];
            break;
    }
    
    // Configure the cell...
    
    switch (indexPath.row) {
        case 0:
            ((SimpleExpenseCell*)cell).titleLabel.text = @"Title";
            ((SimpleExpenseCell*)cell).contentLabel.text = self.expense.title;
            break;
        case 1:
            ((SimpleExpenseCell*)cell).titleLabel.text = @"Date";
            ((SimpleExpenseCell*)cell).contentLabel.text = [self.expense.date stringAsFormat:nil];
            break;
        case 2:
            ((SimpleExpenseCell*)cell).titleLabel.text = @"Amount";
            ((SimpleExpenseCell*)cell).contentLabel.text = [NSString stringWithFormat:@"$ %.2f", self.expense.totalAmountValue];
            break;
        case 3:
            ((SimpleExpenseCell*)cell).titleLabel.text = @"Location";
            ((SimpleExpenseCell*)cell).contentLabel.text = self.expense.location;
            break;
        case 4:
            ((SimpleExpenseCell*)cell).titleLabel.text = @"Category";
            ((SimpleExpenseCell*)cell).contentLabel.text = self.expense.deductCategory.name;
            break;
        case 5:
        {
            ((SegmentedExpenseCell*)cell).titleLabel.text = @"Type";
            [((SegmentedExpenseCell*)cell).segmentedControl removeAllSegments];
            [_allTypes enumerateObjectsUsingBlock:^(CDType* type, NSUInteger idx, BOOL* stop){
                [((SegmentedExpenseCell*)cell).segmentedControl insertSegmentWithTitle:type.name atIndex:idx animated:NO];
                if ([self.expense.type isEqual:type]) {
                    ((SegmentedExpenseCell*)cell).segmentedControl.selectedSegmentIndex = idx;
                }
            }];
        }
            break;
        case 6:
            ((PhotoExpenseCell*)cell).titleLabel.text = @"Receipts";
            ((PhotoExpenseCell*)cell).expense = self.expense;
        default:
            break;
    }
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

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

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PopoverSelectionViewController* selectionVC = [[PopoverSelectionViewController alloc] init];
    switch (indexPath.row) {
        case 4:
        {
            NSArray* categories = [CDDeductionCategory fetchAllWithSortDescriptors:nil inManagedObjectContext:[[CoreDataHelper sharedInstance] moc]];
            NSMutableArray* choices = [NSMutableArray arrayWithCapacity:categories.count];
            [categories enumerateObjectsUsingBlock:^(CDDeductionCategory* cat, NSUInteger idx, BOOL* stop){
                PopoverSelectionItem* item = [[PopoverSelectionItem alloc] init];
                item.value = cat.name;
                item.color = cat.color;
                [choices addObject:item];
            }];
            selectionVC.choices = choices;
            selectionVC.header = @"Category";
            selectionVC.value = self.expense.deductCategory.name;
        }
            break;
            
        default:
            break;
    }
    
    
    selectionVC.modalPresentationStyle = UIModalPresentationPopover;
    UIPopoverPresentationController *presentationController = selectionVC.popoverPresentationController;
    presentationController.delegate = self;
    presentationController.permittedArrowDirections = 0;
    presentationController.sourceView = self.view;
    presentationController.sourceRect = self.view.bounds;
    
    [self.navigationController presentViewController:selectionVC animated:YES completion:nil];
}



#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    _currentTextField = textField;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return NO;
}

#pragma mark - UIPopoverPresentationControllerDelegate

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    return UIModalPresentationNone;
}

@end
