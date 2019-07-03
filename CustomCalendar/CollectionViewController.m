//
//  CollectionViewController.m
//  CustomCalendar
//
//  Created by ZN on 2019/7/3.
//  Copyright © 2019年 nangnahz.nan. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionLayOut.h"
#import "DateCell.h"

@interface CollectionViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [_collectionView registerNib:[UINib nibWithNibName:@"DateCell" bundle:nil] forCellWithReuseIdentifier:@"DateCell"];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;

    CollectionLayOut *flowLayout  = [[CollectionLayOut alloc] init];
    [_collectionView setCollectionViewLayout:flowLayout];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DateCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DateCell" forIndexPath:indexPath];
    cell.textLabel.text = @"Label";
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
