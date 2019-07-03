//
//  ViewController.m
//  CustomCalendar
//
//  Created by ZN on 2019/7/2.
//  Copyright © 2019年 nangnahz.nan. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewController.h"
#import "DateCell.h"
#import "DateModel.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource> {
    NSMutableArray *_dayArray;
    NSInteger _selectedYear;
    NSInteger _selectedMonth;
    NSInteger _selectedDay;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dayArray = [NSMutableArray arrayWithCapacity:0];

    // 代码初始化时，一定要用以下这个方法
    // _collectionView = [UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:(nonnull UICollectionViewLayout *);
    [_collectionView registerNib:[UINib nibWithNibName:@"DateCell" bundle:nil] forCellWithReuseIdentifier:@"DateCell"];
//    [_collectionView registerClass:nil forCellWithReuseIdentifier:@""];
    [_collectionView registerNib:[UINib nibWithNibName:@"DateHeadView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DateHeadView"];
    
    // UICollectionViewLayout 不能直接初始化这个布局对象，必须实现他的子类
    // 更复杂的布局，需要自己写UICollectionViewLayout子类,如瀑布流
    UICollectionViewFlowLayout *flowLayout  = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.itemSize = CGSizeMake(ScreenWidth / 7, ScreenHeight / 7);
    flowLayout.headerReferenceSize = CGSizeMake(ScreenWidth, 50);
    [_collectionView setCollectionViewLayout:flowLayout];
    
    [self dateHandle:[[NSDate date] description]];
}

- (void)dateHandle:(NSString *)dateStr {
    [_dayArray removeAllObjects];
    NSInteger firstWeekDay = [DateModel weekDayMonthOfFirstDayFromDate:[NSDate date]];
    NSInteger count = [DateModel totalDaysInMonthFromDate:[NSDate date]];
    
    // 补前面的空白
    for (NSInteger i = 0; i < firstWeekDay; i ++) {
        [_dayArray addObject:@""];
    }
    for (NSInteger i = 0; i < count; i ++) {
        [_dayArray addObject:@(i + 1)];
    }
    // 补后面的空白
    NSInteger leftDay = 0;
    if (_dayArray.count % 7) {
        leftDay = 7 - _dayArray.count % 7;
    }
    for (NSInteger i = 0; i < leftDay; i ++) {
        [_dayArray addObject:@""];
    }
    
    [_collectionView reloadData];
}

#pragma mark --- UICollectionViewDataSource ---
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dayArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DateCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DateCell" forIndexPath:indexPath];
    cell.textLabel.text = [_dayArray[indexPath.row] description];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
       UICollectionReusableView *reuseView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DateHeadView" forIndexPath:indexPath];
        return reuseView;
    }
    
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewController *vc = [[CollectionViewController alloc] init];
    [self.navigationController presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
