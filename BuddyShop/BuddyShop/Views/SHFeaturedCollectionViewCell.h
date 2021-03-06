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

/**
 This class will be used to layout the products that are featured and displayed at the top of Home screen.
 */
@interface SHFeaturedCollectionViewCell : UICollectionViewCell

 /// This method will provide the itema and response metadata to configure the cell.
- (void)configureCellWithItem:(SHOutputDataItem *)item andMetadata:(SHAPI *)metadata;
@end
