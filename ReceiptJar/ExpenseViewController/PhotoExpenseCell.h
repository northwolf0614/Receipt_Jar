//
//  PhotoExpenseCell.h
//  ReceiptJar
//
//  Created by Lei Zhao on 26/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataEntityHeaders.h"

@interface PhotoExpenseCell : UITableViewCell <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) CDExpense* expense;
@end
