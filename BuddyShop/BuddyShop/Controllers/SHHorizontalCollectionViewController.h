//
//  SHHorizontalCollectionViewController.h
//  BuddyShop
//
//  Created by Ayisha on 16/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SHResponse;

typedef NS_ENUM(NSUInteger, ScrollDirection) {
    ScrollDirectionLeft,
    ScrollDirectionRight
};

@interface SHHorizontalCollectionViewController : UICollectionViewController
@property (strong, nonatomic) SHResponse *flashResponse;
- (void)scrollWith:(ScrollDirection)direction;
@end
