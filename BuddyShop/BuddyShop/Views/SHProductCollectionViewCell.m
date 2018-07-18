//
//  SHProductCollectionViewCell.m
//  BuddyShop
//
//  Created by Ayisha on 16/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import "SHProductCollectionViewCell.h"
#import "Toast.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "SHResponse.h"

@interface SHProductCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *oldPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *addToCartButton;
@end

@implementation SHProductCollectionViewCell

- (IBAction)didTapCart:(UIButton *)sender {
    [self.contentView makeToast:@"Product is added to cart."];
}

- (void)configureCellWithItem:(SHOutputDataItem *)item andMetadata:(SHAPI *)metadata {
    _titleLabel.numberOfLines = 1;
    [_addToCartButton setBackgroundColor:[UIColor orangeColor]];
    [_imageView sd_setImageWithURL:[NSURL URLWithString: item.image.src]
                  placeholderImage:[UIImage imageNamed:@"placeholder"]];
    _titleLabel.text = item.name;
    
    
    NSAttributedString *oldValueStr =
    [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@", [item.prices.priceOld stringValue], metadata.currency]
                                    attributes: @{NSForegroundColorAttributeName: [UIColor grayColor], NSStrikethroughStyleAttributeName:
                                                      [NSNumber numberWithInteger:NSUnderlineStyleSingle]}];
    
    
    _oldPriceLabel.attributedText = oldValueStr;
    _currentPriceLabel.text = [NSString stringWithFormat:@"%@ %@", item.prices.priceNew, metadata.currency];
    [_addToCartButton setTitle:@"ADD TO CART" forState:UIControlStateNormal];
}
@end
