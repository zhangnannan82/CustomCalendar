//
//  CollectionLayOut.m
//  CustomCalendar
//
//  Created by ZN on 2019/7/3.
//  Copyright © 2019年 nangnahz.nan. All rights reserved.
//

#import "CollectionLayOut.h"

@interface CollectionLayOut ()
{
    NSMutableArray <UICollectionViewLayoutAttributes *> *layOutArr;
    NSMutableArray *_originYArray;
    NSInteger _collectionViewRow;
}
@end

@implementation CollectionLayOut

- (instancetype)init {
    self = [super init];
    if (self) {
        layOutArr = [NSMutableArray array];
        _collectionViewRow = 3;
        _originYArray = [NSMutableArray array];
    }
    return self;
}

- (void)prapareLayout {
    // 对每一个cell的布局进行初始化
    [layOutArr removeAllObjects];
    [_originYArray removeAllObjects];
    for (NSInteger i = 0; i < _collectionViewRow; i ++) {
        [_originYArray addObject:@(0)];
    }
    
    NSInteger cellCount = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger i = 0; i < cellCount; i ++) {
         // 每一个cell的布局属性
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UICollectionViewLayoutAttributes *Attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        [layOutArr addObject:Attributes];
    }
}

// 可以用自己的
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    float cellWidth = [UIScreen mainScreen].bounds.size.width / _collectionViewRow;
    float cellHeight = 50 + arc4random_uniform(100);//
    float cellOriginX = cellWidth * (indexPath.row % _collectionViewRow);
    float cellOriginY = [_originYArray[indexPath.row % 3] floatValue];
    _originYArray[indexPath.row % 3] = @(cellOriginY + cellHeight);
    
    attributes.frame = CGRectMake(cellOriginX, cellOriginY, cellWidth, cellHeight);
    return attributes;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    return layOutArr;
}

@end
