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
    return 10;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([PhotoCollectionViewCell class]) forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout{

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 200);
}
@end
