//
//  SHHorizontalCollectionViewController.m
//  BuddyShop
//
//  Created by Ayisha on 16/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import "SHHorizontalCollectionViewController.h"
#import "SHFeaturedCollectionViewCell.h"

@interface SHHorizontalCollectionViewController ()
@property (nonatomic, strong) NSArray * arrayImages;

@end

@implementation SHHorizontalCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.arrayImages = [NSArray arrayWithObjects:@"iPhone", @"bedroomMirror", @"tvSet", @"iPhone", @"bedroomMirror", @"iPhone", @"tvSet", nil];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self.arrayImages count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SHFeaturedCollectionViewCell *cell = (SHFeaturedCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    int row = [indexPath row];
//    cell.imageView.image = [UIImage imageNamed:[arrayImages objectAtIndex:indexPath.row]];
    return cell;
}

@end
