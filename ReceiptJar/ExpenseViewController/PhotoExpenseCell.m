//
//  PhotoExpenseCell.m
//  ReceiptJar
//
//  Created by Lei Zhao on 26/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import "PhotoExpenseCell.h"
#import "PhotoCollectionViewCell.h"

@implementation PhotoExpenseCell

- (void)awakeFromNib {
    // Initialization code
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([PhotoCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([PhotoCollectionViewCell class])];
    self.collectionView.collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
    ((UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout).scrollDirection = UICollectionViewScrollDirectionHorizontal;
    ((UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout).minimumLineSpacing = 8;
    ((UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout).minimumInteritemSpacing = 8;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.expense.receipts count];
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([PhotoCollectionViewCell class]) forIndexPath:indexPath];
    
    CDReceipt* receipt = self.expense.receipts[indexPath.item];
    
    cell.imageView.image = [receipt.documents[0] image];
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout{

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CDReceipt* receipt = self.expense.receipts[indexPath.item];
    CDDocument* doc = receipt.documents[0];
    
    CGFloat x = (200.0 - ((UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout).minimumLineSpacing * 2.0) / doc.image.size.width;
    CGFloat y = (200.0 - ((UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout).minimumLineSpacing * 2.0) / doc.image.size.height;
    CGFloat r = MAX(x, y);
    
    return CGSizeMake(r * doc.image.size.width, r * doc.image.size.height);
}
@end
