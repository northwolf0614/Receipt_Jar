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

@interface PopoverSelectionViewController ()

@end

@implementation PopoverSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.separator.backgroundColor = DEFAULT_GREY;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PopoverSelectionItemCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([PopoverSelectionItemCell class])];
    
    self.tableView.layer.borderColor = [DEFAULT_GREY CGColor];
    self.tableView.layer.borderWidth = 2.0f;
    self.tableView.layer.cornerRadius =8.0f;
    
//    [self.view addMotionEffect:[[LZUtility sharedInstance] motionAtFront]];
//    self.view.layer.shadowColor = [[UIColor blackColor] CGColor];
//    self.view.layer.shadowOffset = CGSizeMake(-2.0, -3.0);
//    self.view.layer.shadowOpacity = 1.0;
//    self.view.layer.shadowRadius = 2.0f;
    
    self.titleLabel.text = self.header;
    self.textField.text = self.value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //Add effects to popover view;
    UIView* popoverView = self.view.superview;
    while (![popoverView isKindOfClass:[UIWindow class]] || ![NSStringFromClass([popoverView class]) containsString:@"_UIPopoverView"]) {
        popoverView = popoverView.superview;
    }
    if ([NSStringFromClass([popoverView class]) containsString:@"_UIPopoverView"]) {
        [popoverView addMotionEffect:[[LZUtility sharedInstance] motionAtFront]];
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
@end
