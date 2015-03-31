//
//  PopoverSelectionViewController.m
//  ReceiptJar
//
//  Created by Lei Zhao on 30/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import "PopoverSelectionViewController.h"
#import "Constants.h"
#import <LZUtility.h>
#import "PopoverSelectionItemCell.h"

@interface PopoverSelectionViewController ()<UITextFieldDelegate>

@end

@implementation PopoverSelectionViewController{
    UITapGestureRecognizer* _tap;
}
@synthesize header = _header;
@synthesize value = _value;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.separator.backgroundColor = DEFAULT_GREY;
    
    _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnView)];
    [self.view addGestureRecognizer:_tap];
    _tap.enabled = NO;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PopoverSelectionItemCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([PopoverSelectionItemCell class])];
    
    self.tableView.layer.borderColor = [DEFAULT_GREY CGColor];
    self.tableView.layer.borderWidth = 2.0f;
    self.tableView.layer.cornerRadius = 8.0f;
    
    self.textField.delegate = self;
    
    self.titleLabel.text = self.header;
    self.textField.text = self.value;
    
    if (self.choices.count == 0) {
        [self.tableView removeFromSuperview];
        [self.separator removeFromSuperview];
    }
    
    self.preferredContentSize = [self calculateContentSize];
}

- (CGSize)calculateContentSize{
    CGFloat height = 20.0 + 20.0 + 8.0;
    
    CGFloat labelHeight = [self.titleLabel sizeThatFits:[[UIScreen mainScreen] bounds].size].height;
    
    height += labelHeight;
    
    if (self.choices.count > 0) {
        height += 8.0;
        height += (24.0 + labelHeight) * MIN(5, self.choices.count);
    }
    
    return CGSizeMake(320, height);
}

- (void)setHeader:(NSString *)header{
    if (_header == header) {
        return;
    }
    _header = header;
    self.titleLabel.text = _header;
}

- (void)setValue:(NSString *)value{
    if (_value == value) {
        return;
    }
    
    _value = value;
    self.textField.text = _value;
}

- (void)tapOnView{
    [self.textField resignFirstResponder];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //Add effects to popover view;
    UIView* popoverView = self.view.superview;
    while (popoverView != nil && ![popoverView isKindOfClass:[UIWindow class]] && ![NSStringFromClass([popoverView class]) containsString:@"_UIPopoverView"]) {
        popoverView = popoverView.superview;
    }
    if ([NSStringFromClass([popoverView class]) containsString:@"_UIPopoverView"]) {
        [popoverView addMotionEffect:[[LZUtility sharedInstance] motionAtFront]];
        popoverView.layer.shadowColor = [[UIColor blackColor] CGColor];
        popoverView.layer.shadowOffset = CGSizeMake(2.0, 3.0);
        popoverView.layer.shadowOpacity = 0.3;
        popoverView.layer.shadowRadius = 2.0f;
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.choices.count;
}

#pragma mark - UITableViewDelegate

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PopoverSelectionItemCell* cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PopoverSelectionItemCell class]) forIndexPath:indexPath];
    
    PopoverSelectionItem* item = self.choices[indexPath.row];
    cell.indicator.backgroundColor = item.color;
    cell.valueLabel.text = item.value;
    if ([item.value isEqualToString:self.value]) {
        [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.delegate selectionViewController:self withHeader:self.header didSelectItem:self.choices[indexPath.row]];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    _tap.enabled = YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    _tap.enabled = NO;
    
    if ([textField.text isEqualToString:self.value]) {
        return;
    }
    
    __block BOOL selectedAnItem = NO;
    [self.choices enumerateObjectsUsingBlock:^(PopoverSelectionItem* item, NSUInteger idx, BOOL* stop){
        if ([item.value isEqualToString:textField.text]) {
            [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:idx inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
            [self.delegate selectionViewController:self withHeader:self.header didSelectItem:item];
            *stop = YES;
            selectedAnItem = YES;
        }
    }];
    
    if (!selectedAnItem) {
        [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
        [self.delegate selectionViewController:self withHeader:self.header didChangeValueTo:textField.text];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return NO;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return self.enable;
}
@end
