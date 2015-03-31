//
//  PopoverSelectionViewController.h
//  ReceiptJar
//
//  Created by Lei Zhao on 30/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopoverSelectionItem.h"

@class PopoverSelectionViewController;

@protocol PopoverSelectionViewDelegate <NSObject>

- (void)selectionViewController:(PopoverSelectionViewController*)selectionViewController withHeader:(NSString*)header didChangeValueTo:(NSString*)value;
- (void)selectionViewController:(PopoverSelectionViewController*)selectionViewController withHeader:(NSString*)header didSelectItem:(PopoverSelectionItem*)item;

@end

@interface PopoverSelectionViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, weak) id<PopoverSelectionViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *separator;

@property (nonatomic, assign) BOOL enable;

@property (nonatomic, strong) NSString* header;
@property (nonatomic, strong) NSString* value;
@property (nonatomic, strong) NSArray* choices;

@end
