//
//  SHFeaturedCollectionViewCell.h
//  BuddyShop
//
//  Created by Ayisha on 16/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SHOutputDataItem;
@class SHAPI;

@interface SHFeaturedCollectionViewCell : UICollectionViewCell
- (void)configureCellWithItem:(SHOutputDataItem *)item andMetadata:(SHAPI *)metadata;
@end
