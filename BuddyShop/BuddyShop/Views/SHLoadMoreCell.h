//
//  SHLoadMoreCell.h
//  BuddyShop
//
//  Created by Ayisha on 18/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SHLoadMoreCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelLoading;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@end
