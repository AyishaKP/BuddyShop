//
//  SHHorizontalCollectionViewController.m
//  BuddyShop
//
//  Created by Ayisha on 16/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import "SHHorizontalCollectionViewController.h"
#import "SHFeaturedCollectionViewCell.h"
#import "SHResponse.h"
@class SHOutputDataItem;


@interface SHHorizontalCollectionViewController ()
@property (nonatomic, strong) NSMutableArray* itemsArray;
@end

@implementation SHHorizontalCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)scrollWith:(ScrollDirection)direction {
    CGRect collectionBounds = self.collectionView.bounds;
    CGFloat contentOffset;
    if (direction == ScrollDirectionLeft) {
        contentOffset = (CGFloat)(floor(self.collectionView.contentOffset.x - collectionBounds.size.width - 8));
    }else {
        contentOffset = (CGFloat)(floor(self.collectionView.contentOffset.x + collectionBounds.size.width + 8));
    }
    [self moveCollectionToFrame:contentOffset];
}

-(void)moveCollectionToFrame:(CGFloat)contentOffset {
    
    CGRect frame = CGRectMake(contentOffset, self.collectionView.contentOffset.y, self.collectionView.frame.size.width, self.collectionView.frame.size.width);
    [self.collectionView scrollRectToVisible:frame animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)setFlashResponse:(SHResponse *)flashResponse {
    if (_itemsArray == nil) {
        _itemsArray = [NSMutableArray new];
    }
    _flashResponse = flashResponse;
    [_itemsArray addObjectsFromArray: _flashResponse.output.data.items];
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
    SHFeaturedCollectionViewCell *cell = (SHFeaturedCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    [cell configureCellWithItem:_itemsArray[indexPath.item] andMetadata:_flashResponse.api];
    return cell;
}

@end
