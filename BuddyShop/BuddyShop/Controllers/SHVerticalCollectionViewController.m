//
//  SHVerticalCollectionViewController.m
//  BuddyShop
//
//  Created by Ayisha on 16/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import "SHVerticalCollectionViewController.h"
#import "SHProductCollectionViewCell.h"
#import "SHResponse.h"
@class SHOutputDataItem;

@interface SHVerticalCollectionViewController ()
@property (nonatomic, strong) NSMutableArray* itemsArray;

@end

@implementation SHVerticalCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setHomeResponse:(SHResponse *)homeResponse {
    if (_itemsArray == nil) {
        _itemsArray = [NSMutableArray new];
    }
    _homeResponse = homeResponse;
    [_itemsArray addObjectsFromArray: homeResponse.output.data.items];

    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _itemsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SHProductCollectionViewCell *cell = (SHProductCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    [cell configureCellWithItem:_itemsArray[indexPath.item] andMetadata:_homeResponse.api];
    
    return cell;
}

@end
