//
//  SHProductCollectionViewCell.m
//  BuddyShop
//
//  Created by Ayisha on 16/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import "SHProductCollectionViewCell.h"

@interface SHProductCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *oldPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *addToCartButton;

@end

@implementation SHProductCollectionViewCell
- (IBAction)didTapCart:(UIButton *)sender {
}

@end
