//
//  SHHomeAPIMapper.m
//  BuddyShop
//
//  Created by Ayisha on 17/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import "SHHomeAPIMapper.h"
#import "SHResponse.h"

@implementation SHHomeAPIMapper

+ (void)mapResponseWith:(InCodeMappingProvider *)inCodeMappingProvider {

    
    [inCodeMappingProvider mapFromDictionaryKey:@"NAME"
                                  toPropertyKey:@"name"
                                       forClass:[SHFlashOutputDataItem class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"ID"
                                  toPropertyKey:@"itemId"
                                       forClass:[SHFlashOutputDataItem class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"ACTIVE_FROM"
                                  toPropertyKey:@"activeFrom"
                                       forClass:[SHFlashOutputDataItem class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"ACTIVE_FROM"
                                  toPropertyKey:@"activeTo"
                                       forClass:[SHFlashOutputDataItem class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"SORT"
                                  toPropertyKey:@"sort"
                                       forClass:[SHFlashOutputDataItem class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"STATE"
                                  toPropertyKey:@"state"
                                       forClass:[SHFlashOutputDataItem class]];
    
    /******************* Response - OUTPUT - DATA - ITEM - PRICE**********************/
    [inCodeMappingProvider mapFromDictionaryKey:@"PRICES"
                                  toPropertyKey:@"prices"
                                 withObjectType:[SHFlashOutputDataItemPrice class]
                                       forClass:[SHFlashOutputDataItem class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"PRICE_NEW"
                                  toPropertyKey:@"priceNew"
                                       forClass:[SHFlashOutputDataItemPrice class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"PRICE_OLD"
                                  toPropertyKey:@"priceOld"
                                       forClass:[SHFlashOutputDataItemPrice class]];
    /******************* Response - OUTPUT - DATA - ITEM - IMAGE**********************/
    [inCodeMappingProvider mapFromDictionaryKey:@"IMAGE.SRC"
                                  toPropertyKey:@"image"
                                       forClass:[SHFlashOutputDataItem class]];
    
}


@end
