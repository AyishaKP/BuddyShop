//
//  SHFeaturedCollectionViewCell.m
//  BuddyShop
//
//  Created by Ayisha on 16/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import "SHFeaturedCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "SHResponse.h"

@interface SHFeaturedCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *buttonSale;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelOldPrice;
@property (weak, nonatomic) IBOutlet UILabel *labelCurrentPrice;

@property (assign, nonatomic) BOOL isValid;

@end

@implementation SHFeaturedCollectionViewCell

- (void)configureCellWithItem:(SHOutputDataItem *)item andMetadata:(SHAPI *)metadata {
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString: item.image.src]
                  placeholderImage:[UIImage imageNamed:@"placeholder"]];
    _labelTitle.text = item.name;
    
    
    NSAttributedString *oldValueStr =
    [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@", [item.prices.priceOld stringValue], metadata.currency]
                                                                              attributes: @{NSForegroundColorAttributeName: [UIColor grayColor], NSStrikethroughStyleAttributeName:
                                                                           [NSNumber numberWithInteger:NSUnderlineStyleSingle]}];
    
    
    _labelOldPrice.attributedText = oldValueStr;
    _labelCurrentPrice.text = [NSString stringWithFormat:@"%@ %@", item.prices.priceNew, metadata.currency];
    [_buttonSale setTitle:item.state forState:UIControlStateNormal];
}

@end
